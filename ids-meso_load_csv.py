#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
Author:		Fons Laan, KNAW IISH - International Institute of Social History
Project:	IDS-MESO
Name:		ids-meso_load_csv.py
Version:	0.1
Goal:		Load a CSV file into the corresponding ids-meso db

12-Nov-2015	Created
03-Dec-2015	Changed

If necessary, convert the encoding of the csv files with iconv to utf8
	$ iconv -f ISO-8859-15 -t UTF-8 das_map-latin9.csv > das_map-utf8.csv

Notice: '\r\n' 0x0D0A line endings
USE ids_sport;
LOAD DATA LOCAL INFILE "/tmp/ids-meso/sport.csv" INTO TABLE sport FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;

Query OK, 16954 rows affected, 22414 warnings (0.29 sec)
Records: 16954  Deleted: 0  Skipped: 0  Warnings: 22414
python import via load_csv(): OK

Notice: '\n' 0x0D0A line endings
USE ids_das;
LOAD DATA LOCAL INFILE "/tmp/ids-meso/das.csv" INTO TABLE das FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 LINES;
Query OK, 18789 rows affected (0.17 sec)             
Records: 18789  Deleted: 0  Skipped: 0  Warnings: 0
python import via load_csv(): FAIL, TODO

Notice: '\r\n' 0x0D0A line endings
USE ids_erkenningen;
LOAD DATA LOCAL INFILE "/tmp/ids-meso/erkenningen.csv" INTO TABLE erkenningen FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;
Query OK, 8984 rows affected (0.13 sec)
Records: 8984  Deleted: 0  Skipped: 0  Warnings: 0
python import via load_csv(): TODO

Notice: '\r\n' 0x0D0A line endings
USE ids_zeemonsterrollen;
LOAD DATA LOCAL INFILE "/tmp/ids-meso/zeemonsterrollen-utf8.csv" INTO TABLE zeemonsterrollen FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;
Query OK, 5321 rows affected (0.07 sec)              
Records: 5321  Deleted: 0  Skipped: 0  Warnings: 0
"""

# python-future for Python 2/3 compatibility
from __future__ import ( absolute_import, division, print_function, unicode_literals )
from builtins import ( ascii, bytes, chr, dict, filter, hex, input, int, map, next, 
	oct, open, pow, range, round, str, super, zip )

import os
from sys import exit, stderr, exc_info
import csv
import datetime
from time import time
import MySQLdb


ADD_PK = False

base_dir = "/home/fons/projects/IDS-MESO/DBs"		# NB
#base_dir = "/data/ids-meso/DBs"						# Node-158

#db_source = "das"				# 1
#db_source = "sport"			# 2
db_source = "erkenningen"		# 3
#db_source = "zeemonster"		# 4
#db_source = "migranten"		# 5 only map
#db_source = "hisvak"			# 6	only map
#db_source = "stakingen"		# 7 only map

db_type = "data"
#db_type = "map"

#db_action = "inspect"
db_action = "insert"


dir_name   = ""
csv_name   = ""
db_name    = ""
db_table   = ""
table_cols = 0

if db_source == "das":
	dir_name = "das"
	db_name    = "1_das"
	if db_type == "data":
		csv_name   = "das.csv"
		db_table   = "das"
		table_cols = 23
	elif db_type == "map":
		csv_name   = "das_map.csv"
		db_table   = "das_map"
		table_cols = 6

elif db_source == "sport":
	dir_name = "sport"
	db_name    = "2_sport"
	if db_type == "data":
		csv_name   = "sport.csv"
		db_table   = "sport"
		table_cols = 33
	elif db_type == "map":
		csv_name   = "sport_map.csv"
		db_table   = "sport_map"
		table_cols = 5

elif db_source == "erkenningen":
	dir_name = "erkenningen"
	db_name    = "3_erkenningen"
	if db_type == "data":
	#	csv_name   = "erkenningen.csv"
		csv_name   = "erkenningen-node158.csv"
		db_table   = "erkenningen"
		table_cols = 43
	elif db_type == "map":
		csv_name   = "erkenningen_map.csv"
		db_table   = "erkenningen_map"
		table_cols = 6

elif db_source == "zeemonster":
	dir_name = "zeemonster"
	db_name    = "4_zeemonster"
	if db_type == "data":
		csv_name   = "zeemonster-utf8.csv"
		db_table   = "zeemonster"
		table_cols = 49
	elif db_type == "map":
		csv_name   = "zeemonster_map.csv"
		db_table   = "zeemonster_map"
		table_cols = 6

elif db_source == "migranten":
	dir_name = "migranten"
	db_name    = "5_migranten"
	if db_type == "data":
		print( "data ?" )
	if db_type == "map":
		csv_name   = "migranten_map.csv"
		db_table   = "migranten_map"

elif db_source == "hisvak":
	dir_name = "hisvak"
	db_name    = "6_hisvak"
	if db_type == "data":
		print( "data ?" )
	elif db_type == "map":
		csv_name   = "hisvak_map.csv"
		db_table   = "hisvak_map"
		table_cols = 7

elif db_source == "stakingen":
	dir_name = "stakingen"
	db_name    = "7_stakingen"
	if db_type == "data":
		print( "data ?" )
	if db_type == "map":
		csv_name   = "stakingen_map.csv"
		db_table   = "stakingen_map"
		table_cols = 6


csv_path  = os.path.join( base_dir, dir_name, csv_name )
print( csv_path )


ids_db = MySQLdb.connect (
	host        = "127.0.0.1",
	user        = "ids",
	passwd      = "msids",
	db          = db_name,
	charset     = "utf8",			# needed because sometimes 
	use_unicode = True				# &...; html escape stuff in strings
)


def column_widths():
	with open( csv_path, 'r' ) as csv_file:
		from collections import OrderedDict		# Python version >= 3.1
		col_widths = OrderedDict()				# Python version >= 3.1
	#	col_widths = {}							# any Python version
		
		col_names = []
		
		reader = csv.reader( csv_file, delimiter = ',', quotechar = '"' )
		
		nrow = 0
		for cols in reader:
			ncols = len( cols )
			
			if nrow == 0:
				print( "header:", cols )
				col_names = cols
				
				for ncol in range( ncols ):
					col_name = col_names[ ncol ]
					col_widths[ col_name ] = 0		# initialize the widths to 0
			else:
				for ncol in range( ncols ):
					col = cols[ ncol ]
					col_name = col_names[ ncol ]
					old_width = col_widths[ col_name ]
					new_width = len( col )
					
					if new_width > old_width:
						col_widths[ col_name ] = new_width

			nrow += 1
		
		print( "number of columns:", ncols )
		print( "column widths:\n", col_widths )



def load_csv():
  #  replace <table_cols-1> below with actual value of table_cols-1
	print( "load_csv():", csv_path )
	
	cursor = ids_db.cursor()
	
	sql = "TRUNCATE TABLE " + db_name + "." + db_table + ";"
	print( sql )
	cursor.execute( sql )
	
	with open( csv_path, 'r' ) as csv_file:
		reader = csv.reader( csv_file, delimiter = ',', quotechar = '"' )
		col_names = []
		
		nrow = 0
		for cols in reader:
		#	print( '\n' )
		#	print( cols )
			
			quoted_cols = []
			for c in cols:
			#	print( c )
				q = c.replace( '"', '\\"' )		# internal " in strings
			#	q = c.replace( '"', '\\"' ).encode( "utf-8" )
			#	print( q )
				quoted_cols.append( q )
			
			row = tuple( quoted_cols )
		#	print( row )
			
			if nrow == 0:
			#	print( row )
				col_names = row
				nrow += 1
				continue
			
			#print( col_names )
			#col_names_str = ( "`%s`, " * <table_cols-1> + "%s" ) % col_names
			col_names_str = ''.join([ "`{0}`, ".format(cn) for cn in col_names ])
			col_names_str = col_names_str[ :-2 ]		# strip trailing ", "
			#print( "col_names_str: |%s|" % col_names_str )
			
			#values_str = ( '\"%s\", ' * <table_cols-1> + '\"%s\"' ) % row
			values_str = ''.join([ '\"{0}\", '.format(s) for s in row ])
			values_str = values_str[ :-2 ]				# strip trailing ", "
			#print( "values_str: |%s|" % values_str )
			
			sql = "INSERT INTO " + db_name + "." + db_table + " ( " + col_names_str + " ) values ( " + values_str + " );"
			print( sql )
			
			cursor.execute( sql )
			
			nrow += 1
			
	nrow -= 1
	print( "written:", nrow, "rows" )

	if ADD_PK:
		try:
			sql = "ALTER TABLE " + db_name + "." + db_table + " ADD `Id` INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT FIRST;"
			print( sql )
			cursor.execute( sql )
		except:
			type, value, tb = exc_info()
			msg = "Exception in write_entry(): %s" % value
			print( "%s\n" % msg )
		
	sql = "SELECT COUNT(*) FROM " + db_name + "." + db_table + ";"
	cursor.execute( sql )
	
	count = 0
	rows = cursor.fetchall ()
	for row in rows:
		count = row[ 0 ]
	print( sql, count )

	ids_db.commit()
	cursor.close()



if __name__ == "__main__":
	if db_action == "inspect":
		column_widths()
	elif db_action == "insert":
		load_csv()

# [eof]
