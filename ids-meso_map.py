#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
Author:		Fons Laan, KNAW IISH - International Institute of Social History
Project:	IDS-MESO
Name:		ids-meso_map.py
Version:	0.1
Goal:		Transform input data data to ids-meso db
Notice:		We use an Enum, so at least Python-3.4 is required; we used 3.5.1.

functions:
def none2empty( var ):
def get_src_col_names( src_db_table ):
def get_source( src_db_name, map_db_table, map_name1 ):
def get_typorg( src_db_name, map_db_table, map_name1 ):
def get_mappings( table_name, src_col_names ):
def get_src_row_count( src_db_table ):
def get_row_counts( ids_db_name, Source ):
def get_row_count( ids_db_name, ids_table_name, Source ):
def get_timestamp( row, col_names ):
def get_timestamp_organization( dst_num, type_ ):

def write_entry_indiv_org( dst_num, Id_I, Relation, mapping ):
def write_entry_org_context( dst_num, Id_C, Relation, mapping ):
def write_entry_context_context( dst_num, Id_C1, Id_C2, Relation, mapping ):
def write_entry_context( dst_row_num, Id_C, type_, value, mapping ):
def write_entry_org_etc( t, Id_O, src_key, src_value, map_record, mapping ):

def process_src_row( t, dst_num, row, col_names, mapping ):
def write_type_org( dst_num, mapping ):
def get_org_id( Org_Id_C, row, col_names ):
def get_context( row, col_names ):
def do_context_das( row, src_col_names ):
def do_context_default( row, src_col_names ):
def get_estimation_missing( day, month, year ):
def analyze_date( date_str, ncomps ):
def get_id( Id_O_col, col_names, row ):
def process_src_table( t, src_col_names, src_count, mapping ):
def process_src_table_orgts( t, src_col_names, src_count, mapping ):
def delete_previous( ids_db_name, Source ):

25-Nov-2015	Created
29-Jan-2016	4_zeemonster no longer used; delete from ids_meso
29-Jan-2016	Changed
"""

# python-future for Python 2/3 compatibility
from __future__ import ( absolute_import, division, print_function, unicode_literals )
from builtins import ( ascii, bytes, chr, dict, filter, hex, input, int, map, next, 
	oct, open, pow, range, round, str, super, zip )

import os
from sys import exit, stderr, exc_info
from enum import Enum
import calendar
import datetime
from time import time
import MySQLdb

debug = False
do_delete_previous = True
nrecords = None		# None, i.e. process all records
#nrecords = 1

class DEstimation( Enum ):	# DateEstimation
	Nothing   = 0
	Year      = 1
	MonthYear = 2
	Exact     = 3

#db_source = "das"				# 1
#db_source = "sport"			# 2
#db_source = "erkenningen"		# 3
#db_source = "zeemonster"		# 4
db_source = "migranten"		# 5
#db_source = "hisvak"			# 6
#db_source = "stakingen"		# 7


src_db_name    = ""
src_db_tables  = []

map_db_table    = ""
map_tables_col1 = []
map_ts_begin    = []
map_ts_end      = []

dst_offset = 0

if db_source == "das":
	src_db_name     = "1_das"
	map_db_table    = "DAS_map"
	map_tables_col1 = [ "DAS" ]
	
	map_ts          = []
	map_ts_begin    = [ "Date of departure" ]
	map_ts_end      = [ "Date of arrival at destination" ]
	map_ts_duration = []
	
	Id_O_col      = [ "", "" ]
	src_db_tables = [ "DAS_Bemanning", "DAS_SCHIP" ]
	
	dst_offset = 1000000
	
	cnames_nl = [ "Aankomst bij Kaap" ]	# DAS context is special
	cnames_us = [ "Arrival at Cape" ]	# DAS context is special

elif db_source == "sport":
	src_db_name     = "2_sport"
	map_db_table    = "sport_map"
	map_tables_col1 = [ "Sport" ]
	
	map_ts          = []
	map_ts_begin    = [ "begindatum" ]
	map_ts_end      = [ "einddatum" ]
	map_ts_duration = []
	
	Id_O_col      = [ "" ]
	src_db_tables = [ "sport" ]

	dst_offset = 2000000

	cnames_nl = [ "plaats",   "gemeente",     "provincie" ]		# ignoring "gemeente1984"
	cnames_us = [ "Locality", "Municipality", "Province" ]

elif db_source == "erkenningen":
	src_db_name     = "3_erkenningen"
	map_db_table    = "erkenningen_map"
	map_tables_col1 = [ "Erkenningen" ]
	
	map_ts          = []
	map_ts_begin    = [ "begindatum" ]
	map_ts_end      = [ "einddatum" ]
	map_ts_duration = []
	
	Id_O_col      = [ "" ]
	src_db_tables = [ "erkenningen" ]
	
	dst_offset = 3000000
	
	cnames_nl = [ "plaats",   "gemeente",     "provincie" ]
	cnames_us = [ "Locality", "Municipality", "Province" ]
	
elif db_source == "zeemonster":
	src_db_name     = "4_zeemonster"
	map_db_table    = "zeemonster_map"
	map_tables_col1 = [ "Zeemonsterrollen Schepenlijst" ]
	
	map_ts          = [ "JAAR" ]
	map_ts_begin    = []	# not available
	map_ts_end      = []	# not available
	map_ts_duration = []
	
	Id_O_col      = [ "" ]
	src_db_tables = [ "zeemonster" ]

	dst_offset = 4000000
	
	cnames_nl = []
	cnames_us = []
	
elif db_source == "migranten":
	src_db_name     = "5_migranten"
	
	map_db_table    = "migranten_map"
	map_tables_col1 = [ "Migranten db" ]
	
	cnames_nl = [ "Vestigingsplaats", "Postcode", "Telefoon",  "Straat", "Huisnr" ]
	cnames_us = [ "Municipality",     "Zip",      "Telephone", "Street", "Nr" ]
	
	map_ts          = []
	map_ts_begin    = [ "StJaar" ]
	map_ts_end      = [ "OphJaar" ]
	map_ts_duration = []
	
#	Id_O_col      = [ "", "", "", "" ]		# IdOrg in solrimport is not unique!, do not use
	Id_O_col      = [ "IdOrg", "IdOrg", "IdPers", "IdOrg" ]	# problem solved?
	src_db_tables = [ "solrimport", "tblorganisatie", "tblpersoon", "tblkoppelpersorg" ]
	
	dst_offset = 5000000
	
elif db_source == "hisvak":
	src_db_name     = "6_hisvak"
	
	map_db_table    = "hisvak_map"
	map_tables_col1 = [ "Vakbond db" ]
	
	map_ts          = []
	map_ts_begin    = [ "Opr_jar", "Opr_mnd", "Opr_dag" ]
	map_ts_end      = [ "Oph_jar", "Oph_mnd", "Oph_dag" ]
	map_ts_duration = []
	
	Id_O_col      = [ "Nrorg_std", "Nrorg_std", "Nrorg_std" ]
	src_db_tables = [ "HISVAK", "HISVAK_BRON", "HISVAK_LID" ]
	
	dst_offset = 6000000
	
	cnames_nl = [ "Plaats_StandaardNaam", "StandaardGemNaam", "StandaardProvincie" ]
	cnames_us = [ "Locality",             "Municipality",     "Province" ]

elif db_source == "stakingen":
	src_db_name     = "7_stakingen"
	map_db_table    = "stakingen_map"
	map_tables_col1 = [ "Stakingen db" ]
	
	map_ts          = []
	map_ts_begin    = [ "JAAR", "MAAND", "DAG" ]
	map_ts_end      = []
	map_ts_duration = [ "DURATION_DAYS" ]
	
	Id_O_col      = [ "", "ActieID", "", "", "", "" ]
	src_db_tables = [ "tblActiesNew", "tblActies_Aantallen", "tblActies_Beroep", "tblActies_Bron", "tblActies_Plaats", "tblActies_Bedrijf" ]
	
	dst_offset = 7000000

	cnames_nl = [ "Locality", "Municipality", "Chamber-of-Commerce", "Province" ]
	cnames_us = [ "Locality", "Municipality", "Chamber-of-Commerce", "Province" ]
	

ids_db_name = "ids_meso"

print( "src_db_name    :", src_db_name )
print( "src_db_tables  :", src_db_tables )
print( "map_db_table   :", map_db_table )
print( "map_tables_col1:", map_tables_col1)
print( "ids_db_name    :", ids_db_name )
print( "dst_offset     :", dst_offset )


missing_keys = set()
missing_list = [ "Unavailable", "Time_Invariant" ]

src_db = MySQLdb.connect \
(
	host        = "127.0.0.1",
	user        = "ids",
	passwd      = "msids",
	db          = src_db_name,
	charset     = "utf8",			# needed because sometimes 
	use_unicode = True				# &...; html escape stuff in strings
)
src_cursor = src_db.cursor()

ids_db = MySQLdb.connect \
(
	host        = "127.0.0.1",
	user        = "ids",
	passwd      = "msids",
	db          = ids_db_name,
	charset     = "utf8",			# needed because sometimes 
	use_unicode = True				# &...; html escape stuff in strings
)
ids_cursor = ids_db.cursor()


def none2empty( var ):
	if var is None or var == "None":
		var = ""
	return var
# none2empty()



def get_src_col_names( src_db_table ):
	# get column names of the source data table
	#print( "get_src_col_names()" )
	
	sql = "DESCRIBE " + src_db_name + "." + src_db_table + ";"
	if debug: print( sql )
	
	src_cursor.execute( sql )
	rows = src_cursor.fetchall()
	
	col_names = [ row[ 0 ] for row in rows ]
#	print( col_names )

	return col_names
# get_src_col_names()



def get_source( src_db_name, map_db_table, map_name1 ):
	sql  = "SELECT Value FROM `" + src_db_name + "`.`" + map_db_table + "` "
	sql += "WHERE ( `" + map_name1 + "` IS NULL OR `" + map_name1 + "` = '' ) " 
	sql += "AND Type_T = 'ORGANIZATION' "
	sql += "AND Type = 'SOURCE'" + ";"
	print( sql )

	src_cursor.execute( sql )
	rows = src_cursor.fetchall()
	
#	print( rows )
	Source = ""
	if rows != ():
		Source = rows[ 0 ][ 0 ]
	print( "Source:", Source )

	return Source
# get_source()



def get_typorg( src_db_name, map_db_table, map_name1 ):
	sql  = "SELECT Value FROM `" + src_db_name + "`.`" + map_db_table  + "` "
	sql += "WHERE ( `" + map_name1 + "` IS NULL OR `" + map_name1 + "` = '' ) " 
	sql += "AND Type_T = 'ORGANIZATION' "
	sql += "AND Type = 'TYPE_ORGANIZATION'" + ";"
	print( sql )

	src_cursor.execute( sql )
	rows = src_cursor.fetchall()
	
#	print( rows )
	Type_Org = ""
	if rows != ():
		Type_Org = rows[ 0 ][ 0 ]
	print( "Type_Org:", Type_Org )
	
	return Type_Org
# get_typorg()



def get_mappings( table_name, src_col_names ):
	# match the columns names of the source data table to the mapping table
	print( "get_mappings()" )
	
	map_name1 = map_tables_col1[ 0 ]
	
	ncols = len( src_col_names )
	mapping = {}
	
	for c in range( ncols ):
		src_col_name  = src_col_names [ c ]
		#print( "%2d %s" %  ( c, src_col_name ) )

		# find src_col_name in mapping table
		sql  = "SELECT * FROM `" + src_db_name + "`.`" + map_db_table  + "` "
		sql += "WHERE `Table` = '" + table_name + "' "
		sql += "AND `" + map_name1 + "` = '" + src_col_name + "' "
		sql += ";"
		if debug: print( sql )
	
		src_cursor.execute( sql )
		rows = src_cursor.fetchall()
	
		for row in rows:
			#print( row )
			# Notice: row[ 0 ] = pk Added !
			# Notice: row[ 1 ] = "DAS", "Sport", etc
			key = row[ 1 ]
			value = { 
				"src_table" : row[ 2 ], 	# Table
				"map_table" : row[ 3 ], 	# Type_T
				"type_"     : row[ 4 ], 	# Type
				"value"     : row[ 5 ], 	# Value
				"dtype"     : row[ 6 ]		# DataType
			}
			mapping[ key ] = value
			if debug: print( "mapping column name:", "key:", key, "value:", value )
		#print( "mapping:", mapping )
	
	return mapping
# get_mappings()



def get_src_row_count( src_db_table ):
	print( "get_src_row_count()" )
	
	sql = "SELECT COUNT(*) FROM `" + src_db_name + "`.`" + src_db_table + "`;"
	
	src_cursor.execute( sql )
	rows = src_cursor.fetchall ()
	
	count = rows[ 0 ][ 0 ]
	return count
# get_src_row_count()



def get_row_counts( ids_db_name, Source ):
	
	ids_table_names = [ "CONTEXT", "CONTEXT_CONTEXT", "INDIVIDUAL", "INDIV_CONTEXT", 
		"INDIV_ORG", "ORGANIZATION", "ORG_CONTEXT", "ORG_ORG" ]
	
	print( "\nRow counts per ids table for Source: %s" % Source )
	for ids_table_name in ids_table_names:
		sql  = "SELECT COUNT(*) FROM `" + ids_db_name + "`.`" + ids_table_name + "`"
		sql += " WHERE Source = '" + Source + "';"
		
		if debug: print( sql )
		ids_cursor.execute( sql )
		
		rows = ids_cursor.fetchall ()
		for row in rows:
			#print( "row:", row )
			count = row[ 0 ]
			print( "%15s: %d" % ( ids_table_name, count ) )
		
# get_row_counts()



def get_row_count( ids_db_name, ids_table_name, Source ):
	
	sql  = "SELECT COUNT(*) FROM `" + ids_db_name + "`.`" + ids_table_name + "`"
	sql += " WHERE Source = '" + Source + "';"
		
	if debug: print( sql )
	ids_cursor.execute( sql )
	
	rows = ids_cursor.fetchall ()
	for row in rows:
		#print( "row:", row )
		count = row[ 0 ]
		print( "%15s: %d" % ( ids_table_name, count ) )
# get_row_count()



def get_timestamp( row, col_names ):
	if debug: print( "get timestamp()" )
	# loop over the column values of a source row, 
	# to get the timestap values that we need for each ids-meso entry
	"""
	class DE( Enum ):
	Nothing   = 0
	Year      = 1
	MonthYear = 2
	Exact     = 3
	"""
	ncols = len( col_names )
	ts = {}
	
	ts[ "Missing" ] = ""
	
	begin_DE = None
	end_DE   = None
	
	begin_Missing = ""
	end_Missing   = ""
	
	start_day_str = start_month_str = start_year_str = ""
	end_day_str   = end_month_str   = end_year_str   = ""
	
	event_str = ""
	start_str = ""
	end_str   = ""
	
	event_day = event_month = event_year = 0
	start_day = start_month = start_year = 0
	end_day   = end_month   = end_year   = 0
	
	duration_str  = ""
	duration_days = 0
	
	ncomps = 0
	
	for c in range( ncols ):
		name  = col_names [ c ]
		value = str( row[ c ] )
		if debug: print( "name: %s, value: %s" % ( name, value ) )
		
		if len( map_ts_begin ) == 1:
			ncomps = 1
			if name == map_ts_begin[ 0 ]:
				start_str = value
				if debug: print( "start_str: %s" % start_str )
		elif len( map_ts_begin ) == 3:		# y/m/d 0/1/2 assumed
			ncomps = 3
			if name == map_ts_begin[ 0 ]:
				start_year_str = none2empty( value )
			elif name == map_ts_begin[ 1 ]:
				start_month_str = none2empty( value )
			elif name == map_ts_begin[ 2 ]:
				start_day_str = none2empty( value )
		#else:
		#	print( "len( map_ts_begin ) %d ?" % len( map_ts_begin ) )
		
		if len( map_ts_end ) == 1:
			ncomps = 1
			if name == map_ts_end[ 0 ]:
				end_str = value
				if debug: print( "end_str: %s" % end_str )
		elif len( map_ts_end ) == 3:		# y/m/d 0/1/2 assumed
			ncomps = 3
			if name == map_ts_end[ 0 ]:
				end_year_str = none2empty( value )
			elif name == map_ts_end[ 1 ]:
				end_month_str = none2empty( value )
			elif name == map_ts_end[ 2 ]:
				end_day_str = none2empty( value )
		#else:
		#	print( "len( map_ts_end ) %d ?" % len( map_ts_end ) )
		
		if len( map_ts_duration ) == 1:
			if name == map_ts_duration[ 0 ]:
				if debug: print( "value: '%s'" % value )
				duration_str =  none2empty( value )
				if duration_str != "":
					if debug: print( "duration_str: %s" % duration_str )
					duration_days = round( float( duration_str ) )
				if debug: print( "duration_str: %s, duration_days: %d" % ( duration_str, duration_days ) )
		
		if len( map_ts ) == 1:
			if name == map_ts[ 0 ]:
				event_str = none2empty( value )
				#print( "name:", name, "event_str:", event_str )
			
	if len( map_ts_begin ) == 3:
		#print( "start components:", start_day_str, start_month_str, start_year_str )
		start_str = start_day_str + "-" + start_month_str + "-" + start_year_str
	
	if len( map_ts_end ) == 3:
		#print( "end components:", end_day_str, end_month_str, end_year_str )
		end_str = end_day_str + "-" +  end_month_str + "-" + end_year_str
	
	if len( map_ts_duration ) == 1 and not (
		start_day_str == "" or start_month_str == "" or start_year_str == "" ):
		ncomps = 3	# we make them below
		#print( "start_str: %s, duration_days: %d" % ( start_str, duration_days ) )
		
		# the input date is not always valid
		year  = int( start_year_str )
		month = int( start_month_str )
		day   = int( start_day_str )
		weekday, numdays = calendar.monthrange( int(start_year_str), int(start_month_str) )
		if numdays < day:
			new_day_str = str( numdays )
			new_start_str = new_day_str + "-" + start_month_str + "-" + start_year_str
			start_date = datetime.datetime.strptime( new_start_str, "%d-%m-%Y" ).date()
		else:
			start_date = datetime.datetime.strptime( start_str, "%d-%m-%Y" ).date()
		#print( "start_date:", start_date )
		
		end_date   = start_date + datetime.timedelta( days = duration_days )
		#print( "end_date:", end_date )
		end_day   = end_date.day
		end_month = end_date.month
		end_year  = end_date.year
		end_str   = "%s-%s-%s" % ( end_day, end_month, end_year )
		#print( end_str, end_day, end_month, end_year )
		
	if debug: print( map_ts_begin, start_str )
	start_day, start_month, start_year, begin_DE = analyze_date( start_str, ncomps )
	if debug: print( start_day, start_month, start_year, begin_DE )
	
	if debug: print( map_ts_end, end_str )
	end_day, end_month, end_year, end_DE = analyze_date( end_str, ncomps )
	if debug: print( end_day, end_month, end_year, end_DE )
	
	ts[ "Start_Day" ]   = start_day
	ts[ "Start_Month" ] = start_month
	ts[ "Start_Year" ]  = start_year
	
	ts[ "End_Day" ]   = end_day
	ts[ "End_Month" ] = end_month
	ts[ "End_Year" ]  = end_year
	
	ts[ "DURATION_DAYS" ] = duration_days
	
	estimation_value = 0
	missing = ""
	
	if begin_DE == DEstimation.Nothing:		# use end_DE
		estimation_value = end_DE.value
		missing = "Begin Period Unavailable"
		if end_year == 0:
			missing = "Unavailable"
		#print( "end", end_DE, estimation_value, missing )
	elif end_DE == DEstimation.Nothing:		# use begin_DE
		estimation_value = begin_DE.value
		missing = "End Period Unavailable"
		if start_year == 0:
			missing = "Unavailable"
		#print( "begin", begin_DE, estimation_value, missing )
	else:									# use both DEs
		estimation_value = min( begin_DE.value, end_DE.value )
		if start_year == 0 or end_year == 0:
			if start_year == 0 and end_year == 0:
				missing = "Unavailable"
			elif start_year == 0:
				missing = "Begin Period Unavailable"
			elif end_year == 0:
				missing = "End Period Unavailable"
		#print( "both", begin_DE, end_DE, estimation_value )
	
	estimation = ""
	if estimation_value > 0:
		estimation = DEstimation( estimation_value ).name
	
	ts[ "Estimation" ] = estimation
	ts[ "Missing" ]    = missing
	
	ts[ "Day" ]   = event_day
	ts[ "Month" ] = event_month
	ts[ "Year" ]  = event_year
	
	if debug: print( "len( map_ts )", len( map_ts ) ) 
	if len( map_ts ) == 1:
		if event_str == "":
			ts[ "Estimation" ] = ""
			ts[ "Missing" ]    = "Unavailable"
		else:
			ts[ "Year" ] = event_str
			ts[ "Estimation" ] = "Year"
			ts[ "Missing" ]    = ""
	
	if debug: print( "ts:", ts )
	#print( "EXIT" )
	#exit( 0 )
	return ts
# get_timestamp()



def get_timestamp_organization( dst_num, type_ ):
	if debug: print( "get_timestamp_organization()", dst_num, type_ )
	
	colsl = [ "Date_Type", "Estimation", "Day", "Month", "Year", "Hour", "Minute", 
		  "Start_Day", "Start_Month", "Start_Year", "End_Day", "End_Month", "End_Year", "Missing" ]
	colss = ", ".join( colsl )
	if debug: print( colss )
	
	Id_O = dst_num
	sql = "SELECT " + colss + " FROM `ids_meso`.`ORGANIZATION` WHERE Id_O = " + str(Id_O) + " AND Type = 'TYPE_ORGANIZATION';"
	if debug: print( sql )
	
	ids_cursor.execute( sql )
	
	timestamp = {}
	row = ids_cursor.fetchone ()
	if debug: print( "row:", row )
	if row is not None:
		values = list( row )
		for c in range( len( colsl ) ):
			key = colsl[ c ]
			value = values[ c ]
			if value is None:
				if key in [ "Day", "Month", "Year" ]:
					value = 0
				else:
					value = ""
			timestamp[ key ] = value
	if debug: print( "timestamp:", timestamp )
	
	if debug and timestamp == {}:
		print( "WARNING: get_timestamp_organization() ts not found for Id_O = %d" % Id_O )
	
	return timestamp
# get_timestamp_organization()



def write_entry_indiv_org( dst_num, Id_I, Relation, mapping ):
	if debug: print( "write_entry_indiv_org()" )
	
	ids_table = "INDIV_ORG"
	Id_O      = dst_num
	Id_D      = mapping[ "Id_D" ]
	Source    = mapping[ "Source" ]
	Date_type = mapping[ "Date_type" ]
	
	ts = mapping[ "src"][ "timestamp" ]
	if ts == {}:
		Estimation  = ""
		Start_Day   = 0
		Start_Month = 0
		Start_Year  = 0
		End_Day     = 0
		End_Month   = 0
		End_Year    = 0
		Missing     = ""
	else:
		Estimation  = ts.get( "Estimation" )
		Start_Day   = ts.get( "Start_Day" )
		Start_Month = ts.get( "Start_Month" )
		Start_Year  = ts.get( "Start_Year" )
		End_Day     = ts.get( "End_Day" )
		End_Month   = ts.get( "End_Month" )
		End_Year    = ts.get( "End_Year" )
		Missing     = ts.get( "Missing" )
	
	if Missing is None: Missing = ""
	names  = ""
	values = ()
	
	if Missing in missing_list:
		names  = "( Id_D, Id_O, Id_I, Source, Relation, Missing )"
		values =  ( Id_D, Id_O, Id_I, Source, Relation, Missing )
	else:
		names  = "( Id_D, Id_O, Id_I, Source, Relation, "
		names += "Date_type, Estimation, "
		names += "Start_Day, Start_Month, Start_Year, End_Day, End_Month, End_Year, Missing )"
			
		values = ( Id_D, Id_O, Id_I, Source, Relation, 
			Date_type, Estimation, 
			Start_Day, Start_Month, Start_Year, End_Day, End_Month, End_Year, Missing )
	
	sql  = "INSERT INTO `" + ids_db_name + "`.`" + ids_table + "` " 
	sql += names + " VALUES " + str( values ) + ";"
	if debug: print( sql )

	try:
		ids_cursor.execute( sql )
		ids_db.commit()
	except:
		type, value, tb = exc_info()
		msg = "Exception in write_entry_indiv_org(): %s" % value
		print( "%s\n" % msg )
		print( sql )
		exit( 1 )
# write_entry_indiv_org()



def write_entry_org_context( dst_num, Id_C, Relation, mapping ):
	if debug: print( "write_entry_org_context()" )

	ids_table = "ORG_CONTEXT"
	Id_O      = dst_num
	Id_D      = mapping[ "Id_D" ]
	Source    = mapping[ "Source" ]
	Date_type = mapping[ "Date_type" ]
	
	ts = mapping[ "src"][ "timestamp" ]
	if ts == {}:
		Estimation  = ""
		Start_Day   = 0
		Start_Month = 0
		Start_Year  = 0
		End_Day     = 0
		End_Month   = 0
		End_Year    = 0
		Missing     = ""
	else:
		Estimation  = ts.get( "Estimation" )
		Start_Day   = ts.get( "Start_Day" )
		Start_Month = ts.get( "Start_Month" )
		Start_Year  = ts.get( "Start_Year" )
		End_Day     = ts.get( "End_Day" )
		End_Month   = ts.get( "End_Month" )
		End_Year    = ts.get( "End_Year" )
		Missing     = ts.get( "Missing" )
	
	if Missing is None: Missing = ""
	names  = ""
	values = ()
	
	if Missing in missing_list:
		names  = "( Id_D, Id_O, Id_C, Source, Relation, Missing )"
		values =  ( Id_D, Id_O, Id_C, Source, Relation, Missing )
	else:
		names  = "( Id_D, Id_O, Id_C, Source, Relation, "
		names += "Date_type, Estimation, "
		names += "Start_Day, Start_Month, Start_Year, End_Day, End_Month, End_Year, Missing )"
			
		values = ( Id_D, Id_O, Id_C, Source, Relation, 
			Date_type, Estimation, 
			Start_Day, Start_Month, Start_Year, End_Day, End_Month, End_Year, Missing )
	
	sql  = "INSERT INTO `" + ids_db_name + "`.`" + ids_table + "` " 
	sql += names + " VALUES " + str( values ) + ";"
	if debug: print( sql )

	try:
		ids_cursor.execute( sql )
		ids_db.commit()
	except:
		type, value, tb = exc_info()
		msg = "Exception in write_entry_org_context(): %s" % value
		print( "%s\n" % msg )
		print( sql )
		exit( 1 )
# write_entry_org_context()



def write_entry_context_context( dst_num, Id_C_1, Id_C_2, Relation, mapping ):
	if debug: print( "write_entry_context_context()" )

	ids_table = "CONTEXT_CONTEXT"
	Id_D      = mapping[ "Id_D" ]
	Source    = mapping[ "Source" ]
	Date_type = mapping[ "Date_type" ]
	
	ts = mapping[ "src"][ "timestamp" ]
	if ts == {}:
		Estimation  = ""
		Start_Day   = 0
		Start_Month = 0
		Start_Year  = 0
		End_Day     = 0
		End_Month   = 0
		End_Year    = 0
		Missing     = ""
	else:
		Estimation  = ts.get( "Estimation" )
		Start_Day   = ts.get( "Start_Day" )
		Start_Month = ts.get( "Start_Month" )
		Start_Year  = ts.get( "Start_Year" )
		End_Day     = ts.get( "End_Day" )
		End_Month   = ts.get( "End_Month" )
		End_Year    = ts.get( "End_Year" )
		Missing     = ts.get( "Missing" )
	
	if Missing is None: Missing = ""
	names  = ""
	values = ()
	
	if Missing in missing_list:
		names  = "( Id_D, Id_C_1, Id_C_2, Source, Relation, Missing )"
		values =  ( Id_D, Id_C_1, Id_C_2, Source, Relation, Missing )
	else:
		names  = "( Id_D, Id_C_1, Id_C_2, Source, Relation, Date_type,"
		names += "Estimation, Start_Day, Start_Month, Start_Year, End_Day, End_Month, End_Year, Missing )"
			
		values = ( Id_D, Id_C_1, Id_C_2, Source, Relation, Date_type, 
			Estimation, Start_Day, Start_Month, Start_Year, End_Day, End_Month, End_Year, Missing )
	
	sql  = "INSERT INTO `" + ids_db_name + "`.`" + ids_table + "` " 
	sql += names + " VALUES " + str( values ) + ";"
	if debug: print( sql )

	try:
		ids_cursor.execute( sql )
		ids_db.commit()
	except:
		type, value, tb = exc_info()
		msg = "Exception in write_entry_context_context(): %s" % value
		print( "%s\n" % msg )
		print( sql )
		exit( 1 )
# write_entry_context_context()



def write_entry_context( dst_row_num, Id_C, type_, value, map_record, mapping ):
	if debug: print( "write_entry_context()" )

	#print( map_record )
	map_type = ""
	try:
		map_table = map_record[ "map_table" ]
		map_type  = map_record[ "type_" ]
		map_value = map_record[ "value" ]
		map_dtype = map_record[ "dtype" ]
	except:
		pass
	
	if debug: print( "write_entry_context()" )
#	print( "write_entry_context()" )
	ids_table = "CONTEXT"
	
	Id_D      = mapping[ "Id_D" ]
	Source    = mapping[ "Source" ]
	Date_type = mapping[ "Date_type" ]
	
	ts = mapping[ "src"][ "timestamp" ]
	if ts == {}:
		Estimation  = ""
		Start_Day   = 0
		Start_Month = 0
		Start_Year  = 0
		End_Day     = 0
		End_Month   = 0
		End_Year    = 0
		Missing     = ""
	else:
		Estimation  = ts.get( "Estimation" )
		Start_Day   = ts.get( "Start_Day" )
		Start_Month = ts.get( "Start_Month" )
		Start_Year  = ts.get( "Start_Year" )
		End_Day     = ts.get( "End_Day" )
		End_Month   = ts.get( "End_Month" )
		End_Year    = ts.get( "End_Year" )
		Missing     = ts.get( "Missing" )
	
	if Missing is None: Missing = ""
	names  = ""
	values = ()
	
	if map_type == "DATE_DEPARTURE" or map_type == "LOCATION_DEPARTURE":
		date_value = ""		# date in dmy components
		
		# overwrite the period values
		Estimation, Missing = get_estimation_missing( Start_Day, Start_Month, Start_Year )
		
		if Start_Year != 0:
			"""
			namesl = [ "Id_D", "Id_C", "Source", "Type", "Value", "Missing" ]
			values = ( Id_D, Id_C, Source, map_type, date_value, Missing )
			
			if not( Missing in missing_list: ):
				namesl += [ "Date_type", "Estimation", "Day", "Month", "Year" ]
				values += ( Date_type, Estimation, Start_Day, Start_Month, Start_Year )
				
			names  = "( " + ", ".join( str(n) for n in namesl ) + " )"
			"""
			
			if Missing in missing_list:
				names  = "( Id_D, Id_C, Source, Type, Value, Missing )"
				values = ( Id_D, Id_C, Source, map_type, date_value, Missing )
			else:
				names  = "( Id_D, Id_C, Source, Type, Value, "
				names += "Date_type, Estimation, Day, Month, Year, Missing )"

				values = ( Id_D, Id_C, Source, map_type, date_value, 
					Date_type, Estimation, Start_Day, Start_Month, Start_Year, Missing )

	elif map_type == "DATE_ARRIVAL" or map_type == "LOCATION_ARRIVAL":
		date_value = ""		# date in dmy components
		
		# overwrite the period values
		Estimation, Missing = get_estimation_missing( End_Day, End_Month, End_Year )
		
		if End_Year != 0:
			"""
			namesl = [ "Id_D", "Id_C", "Source", "Type", "Value", "Missing" ]
			values = ( Id_D, Id_C, Source, map_type, date_value, Missing )
			
			if not( Missing in [ "", "Unavailable", "Time_Invariant" ]: ):
				namesl += [ "Date_type", "Estimation", "Day", "Month", "Year" ]
				values += ( Date_type, Estimation, End_Day, End_Month, End_Year )
				
			names  = "( " + ", ".join( str(n) for n in namesl ) + " )"
			"""
			
			if Missing in missing_list:
				names  = "( Id_D, Id_C, Source, Type, Value, Missing )"
				values =  ( Id_D, Id_C, Source, map_type, date_value, Missing )
			else:
				names  = "( Id_D, Id_C, Source, Type, Value, "
				names += "Date_type, Estimation, Day, Month, Year, Missing )"
				
				values = ( Id_D, Id_C, Source, map_type, date_value, 
					Date_type, Estimation, End_Day, End_Month, End_Year, Missing )

	else:
		"""
		namesl = [ "Id_D", "Id_C", "Source", "Type", "Value", "Missing" ]
		values = ( Id_D, Id_C, Source, map_type, date_value, Missing )
		
		if not( if Missing in missing_list: ):
			namesl += [ "Date_type", "Estimation", "Start_Day", "Start_Month", "Start_Year", "End_Day", "End_Month", "End_Year" ]
			values += ( Date_type, Estimation, Start_Day, Start_Month, Start_Year, End_Day, End_Month, End_Year )
			
		names  = "( " + ", ".join( str(n) for n in namesl ) + " )"
		"""
		
		if Missing in missing_list:
			names  = "( Id_D, Id_C, Source, type, value, Missing )"
			values =  ( Id_D, Id_C, Source, type_, value, Missing )
		else:
			names  = "( Id_D, Id_C, Source, type, value, "
			names += "Date_type, Estimation, "
			names += "Start_Day, Start_Month, Start_Year, End_Day, End_Month, End_Year, Missing )"
				
			values = ( Id_D, Id_C, Source, type_, value, 
				Date_type, Estimation, 
				Start_Day, Start_Month, Start_Year, End_Day, End_Month, End_Year, Missing )
	
	sql  = "INSERT INTO `" + ids_db_name + "`.`" + ids_table + "` " 
	sql += names + " VALUES " + str( values ) + ";"
	if debug: print( sql )

	try:
		ids_cursor.execute( sql )
		ids_db.commit()
	except:
		type, value, tb = exc_info()
		msg = "Exception in write_entry_context(): %s" % value
		print( "%s\n" % msg )
		print( sql )
		exit( 1 )
# write_entry_context()



def write_entry_org_etc( t, dst_num, src_key, src_value, map_record, mapping ):
	if debug: print( "write_entry_org_etc()" )
	
#	print( "map_record:", map_record )
#	print( Id_O, src_key, src_value, map_record, mapping )
	
	ids_table = ""
	
	map_table = map_record[ "map_table" ]
	map_type  = map_record[ "type_" ]
	map_value = map_record[ "value" ]
	map_dtype = map_record[ "dtype" ]
	
	if debug: print( "map_type:", map_type )
	
	Id_D      = mapping[ "Id_D" ]
	Source    = mapping[ "Source" ]
	Date_type = mapping[ "Date_type" ]
	
	ts = mapping[ "src"][ "timestamp" ]
	if ts == {}:
		Estimation  = ""
		Day         = 0
		Month       = 0
		Year        = 0
		Start_Day   = 0
		Start_Month = 0
		Start_Year  = 0
		End_Day     = 0
		End_Month   = 0
		End_Year    = 0
		Missing     = ""
	else:
		Estimation  = ts.get( "Estimation" )
		Day         = ts.get( "Day" )
		Month       = ts.get( "Month" )
		Year        = ts.get( "Year" )
		Start_Day   = ts.get( "Start_Day" )
		Start_Month = ts.get( "Start_Month" )
		Start_Year  = ts.get( "Start_Year" )
		End_Day     = ts.get( "End_Day" )
		End_Month   = ts.get( "End_Month" )
		End_Year    = ts.get( "End_Year" )
		Missing     = ts.get( "Missing" )
	
	if Missing is None: Missing = ""
	names  = ""
	values = ()
	
	if map_table == "CONTEXT":
		# write_entry_context() now called in process_src_table()
		return
	
	elif map_table == "ORGANIZATION":
		Id_O = dst_num
		ids_table = "ORGANIZATION"
		
		if map_type is None or map_type.lower == "timestamp":
			return	# not written as a separate record
		
		
	#	elif t != 0 and map_type == "ORIGINAL_IDENTIFIER":
	#		return	# only written for single (main) table
			
		elif map_type == "START_DATE":
			date_value = ""		# date in dmy components
			
			# overwrite the period values
			Estimation, Missing = get_estimation_missing( Start_Day, Start_Month, Start_Year )
				
			if Start_Year != 0:
				if Missing in missing_list:
					names  = "( Id_D, Id_O, Source, Type, Value, Missing )"
					values = ( Id_D, Id_O, Source, map_type, src_value, Missing )
				else:
					names  = "( Id_D, Id_O, Source, Type, Value, "
					names += "Date_type, Estimation, Day, Month, Year, Missing )"
					
					values = ( Id_D, Id_O, Source, map_type, date_value, 
						Date_type, Estimation, Start_Day, Start_Month, Start_Year, Missing )

		elif map_type == "END_DATE":
			date_value = ""		# date in dmy components
			
			# overwrite the period values
			Estimation, Missing = get_estimation_missing( End_Day, End_Month, End_Year )
			
			if End_Year != 0:
				if Missing in missing_list:
					names  = "( Id_D, Id_O, Source, Type, Value, Missing )"
					values = ( Id_D, Id_O, Source, map_type, src_value, Missing )
				else:
					names  = "( Id_D, Id_O, Source, Type, Value, "
					names += "Date_type, Estimation, Day, Month, Year, Missing )"
					
					values = ( Id_D, Id_O, Source, map_type, date_value, 
						Date_type, Estimation, End_Day, End_Month, End_Year, Missing )
		
		elif map_type == "PLAY_DAY":
			if src_value == "zondag":
				src_value = "Sunday"
			elif src_value == "alleen_zaterdag":
				src_value = "Saturday"
			elif src_value == "ook_zaterdag":
				src_value = "Saturday and Sunday"
			
			if Missing in missing_list:
				names  = "( Id_D, Id_O, Source, Type, Value, Missing )"
				values = ( Id_D, Id_O, Source, map_type, src_value, Missing )
			else:
				names  = "( Id_D, Id_O, Source, Type, Value, "
				names += "Date_type, Estimation, "
				names += "Start_Day, Start_Month, Start_Year, End_Day, End_Month, End_Year, Missing )"
				
				values = ( Id_D, Id_O, Source, map_type, src_value, 
					Date_type, Estimation, 
					Start_Day, Start_Month, Start_Year, End_Day, End_Month, End_Year, Missing )
			
		else:
			if Missing in missing_list:
				names  = "( Id_D, Id_O, Source, Type, Value, Missing )"
				values = ( Id_D, Id_O, Source, map_type, src_value, Missing )
			else:
				names  = "( Id_D, Id_O, Source, Type, Value, "
				names += "Date_type, Estimation, Day, Month, Year, "
				names += "Start_Day, Start_Month, Start_Year, End_Day, End_Month, End_Year, Missing )"
				
				values = ( Id_D, Id_O, Source, map_type, src_value, 
					Date_type, Estimation, Day, Month, Year, 
					Start_Day, Start_Month, Start_Year, End_Day, End_Month, End_Year, Missing )
		
	elif map_table == "INDIVIDUAL":
		#print( ts )
		if map_type == "":
			return
		
		Id_I      = dst_num
		ids_table = "INDIVIDUAL"
		Missing   = "Time_Invariant"
		
		names  = "( Id_D, Id_I, Source, Type, Value, Missing )"
		values =  ( Id_D, Id_I, Source, map_type, src_value, Missing )
		
		if map_type == "LAST_NAME":		# write INDIV_ORG only once per input record
			if src_db_name  == "1_das":
				relation = "Captain"	# only for 1_das
			else:
				relation = ""
				
			write_entry_indiv_org( dst_num, Id_I, relation, mapping )
		
		
	elif map_table == "INDIV_ORG":
		pass	# via INDIVIDUAL
	
	elif map_table == "ORG_CONTEXT":
		pass	# via CONTEXT
	
	else:
		print( "unsupported table: %s" % ids_table )
		print( "EXIT in write_entry()" )
		exit( 1 )
	
	if names == "" or values == ():
		return
	
	sql  = "INSERT INTO `" + ids_db_name + "`.`" + ids_table + "` " 
	sql += names + " VALUES " + str( values ) + ";"
	if debug: print( sql )
	
	try:
		ids_cursor.execute( sql )
		ids_db.commit()
	except:
		type, value, tb = exc_info()
		msg = "Exception in write_entry_org_etc(): %s" % value
		print( "%s\n" % msg )
		print( sql )
		print( "EXIT" )
		exit( 1 )
	
	#print( "EXIT" )
	#exit( 0 )
# write_entry_org_etc()



def process_src_row( t, dst_num, row, col_names, mapping ):
#	global debug
	if debug: print( "process_src_row(), dst_num:", dst_num )
	# loop over the column values of a source row, 
	# to get the key/value pairs
	
	ncols   = len( col_names )
	nempty  = 0
	nfilled = 0
	
	# write START_DATE and END_DATE only once
	use_comps_start = False		# start date components
	use_comps_end   = False		# end   date components
	if len( map_ts_begin ) == 3:
		use_comps_start = True
	if len( map_ts_end ) == 3:
		use_comps_end = True
#	print( "use_comps:", use_comps_start, use_comps_end )
	
	if debug: print( "row:", row )
	for c in range( ncols ):
		key   = col_names [ c ]
		value = row[ c ]
		
		if value is None:
			value = ""
		else:
			value = str( value )
		if debug: print( "key: %23s, value %s" % ( key, value ) )
		
		if use_comps_start:		# start date components
			if key == map_ts_begin[ 0 ] or key == map_ts_begin[ 1 ] or key == map_ts_begin[ 2 ]:
				if key == map_ts_begin[ 0 ]:
					#print( "pass begin" )
					pass
				elif key == map_ts_begin[ 1 ]: 
					continue
				elif key == map_ts_begin[ 2 ]:
					continue
				
		if use_comps_end:		# start date components
			if key == map_ts_end[ 0 ] or key == map_ts_end[ 1 ] or key == map_ts_end[ 2 ]:
				if key == map_ts_end[ 0 ]:
					#print( "pass end" )
					pass
				elif key == map_ts_end[ 1 ]: 
					continue
				elif key == map_ts_end[ 2 ]:
					continue
			#print( "key: %23s, value: %s, nstart_comp: %s, nend_comp: %s" % ( key, value, nstart_comp, nend_comp ) )
		
		if value is None or value == "":
			nempty += 1
		else:
			if debug: print( "mapping:", mapping )
			nfilled += 1
			if debug: print( "key: %23s, value %s" % ( key, value ) )

			try:
				map_record = mapping[ key ]
				if debug: print( "key:", key, "map_record:", map_record )
			except:
				if debug: print( "ignoring missing key: %s" % key )
				missing_keys.add( key )
				continue
			
			if debug: print( "key: %s, value: %s" % ( key, value ) )
			write_entry_org_etc( t, dst_num, key, value, map_record, mapping )
		#	print( "" )
	
#	print( "%d-of-%d filled colums (%s empty)\n" % ( nfilled, ncols, nempty ))
# process_src_row()



def write_type_org( dst_num, mapping ):
	if debug: print( "write_type_org()" )
	
	ts = mapping[ "src"][ "timestamp" ]
	if ts == {}:
		Estimation  = ""
		Start_Day   = 0
		Start_Month = 0
		Start_Year  = 0
		End_Day     = 0
		End_Month   = 0
		End_Year    = 0
		Missing     = ""
	else:
		Estimation  = ts.get( "Estimation" )
		Start_Day   = ts.get( "Start_Day" )
		Start_Month = ts.get( "Start_Month" )
		Start_Year  = ts.get( "Start_Year" )
		End_Day     = ts.get( "End_Day" )
		End_Month   = ts.get( "End_Month" )
		End_Year    = ts.get( "End_Year" )
		Missing     = ts.get( "Missing" )

	Id_D       = mapping[ "Id_D" ]
	Source     = mapping[ "Source" ]
	Type_Org   = mapping[ "Type_Org" ]
	Date_type  = mapping[ "Date_type" ]
	
	if Missing is None: Missing = ""
	names  = ""
	values = ()
	
	if Missing in missing_list:
		names  = "( Id_D, Id_O, Source, Type, Value, Missing )"
		values = ( Id_D, dst_num, Source, "TYPE_ORGANIZATION", Type_Org, Missing )
	else:
		names  = "( Id_D, Id_O, Source, Type, Value, "
		names += "Date_type, Estimation, Start_Day, Start_Month, Start_Year, End_Day, End_Month, End_Year, Missing )"
		
		values = ( Id_D, dst_num, Source, "TYPE_ORGANIZATION", Type_Org, 
			Date_type, Estimation, 
			Start_Day, Start_Month, Start_Year, End_Day, End_Month, End_Year, Missing )
	
	sql  = "INSERT INTO `" + ids_db_name + "`.`ORGANIZATION` " 
	sql += names + " VALUES " + str( values ) + ";"
	if debug: print( sql )
	
	try:
		ids_cursor.execute( sql )
		ids_db.commit()
	except:
		type, value, tb = exc_info()
		msg = "Exception in write_type_org(): %s" % value
		print( "%s\n" % msg )
		print( sql )
		exit( 1 )
# write_type_org()



def get_org_id( Org_Id_C, row, col_names ):
	print( "get_org_id() Org_Id_C:", Org_Id_C )
	print( "get_org_id() row:", row )
	print( "get_org_id() col_names:", col_names )
	
	Org_Id = ""
	ncols = len( col_names )
	
	for c in range( ncols ):
		name = col_names [ c ]
		print( name )
		if name == Org_Id_C:
			Org_Id = row[ c ]
			
	print( "get_org_id() Org_Id:", Org_Id )
	return Org_Id
# get_org_id()



def get_context( row, col_names ):
#	print( "get context()" )
	# loop over the column values of a source row, 
	# to get the context values that we need for each ids-meso entry
	
	ncols = len( col_names )
	context = {}
	
	for cname_nl in cnames_nl:
		context[ cname_nl ] = ""
	
	for c in range( ncols ):
		name  = col_names [ c ]
		value = row[ c ]
		
		for cname_nl in cnames_nl:
			if name == cname_nl:
			#	context[ cname_nl ] = value.lower()
				context[ cname_nl ] = value
		
	return context
# get_context()



def do_context_das( t, dst_num, context_num, row, src_col_names, mapping ):
	if debug: print( "\ndo_context_das()" )
	if debug: print( mapping )
	
	Id_C = context_num
	ncols = len( src_col_names )
		
	src_db_table = src_db_tables[ t ]
	
	if src_db_table == "DAS_Bemanning":
		for c in range( ncols ):
			type_ = ""
			name  = ""
			col_name = src_col_names [ c ]
			#print( col_name )
			
			map_record = {}
			try:
				map_record = mapping[ col_name ]
			except:
				pass
			
			try:
				col_mapping = mapping[ col_name ]
				#print( col_mapping )
				type_ = col_mapping[ "type_" ]
			except:
				#print( "Not found in mapping:", col_name )
				continue
	
			if col_name == "onbcategory" or col_name == "I":
				type_ = col_mapping[ "type_" ]
				name  = row[ c ]
	
			if name !="":
				#print( "%s: %s" % ( col_name, row[ c ] ) )
				write_entry_context( dst_num, Id_C, type_, name, map_record, mapping )
	
	elif src_db_table == "DAS_SCHIP":
		for c in range( ncols ):
			type_ = ""
			name  = ""
			col_name = src_col_names [ c ]
			#print( col_name )
			
			map_record = {}
			try:
				map_record = mapping[ col_name ]
			except:
				pass
			
			try:
				col_mapping = mapping[ col_name ]
				#print( col_mapping )
				type_ = col_mapping[ "type_" ]
			except:
				#print( "Not found in mapping:", col_name )
				continue
			
			if col_name == "Arrival at Cape":
				type_ = "JOURNEY"
				if row[ c ] == "":
					name = "Holland-East-Indies"
				else:
					name = "Holland-Cape-East Indies"
					
			elif( col_name == "Date of departure" or 
				col_name == "Place of departure" or 
				col_name == "Departure from Cape" or 
				col_name == "Date of arrival at destination" or 
				col_name == "Place of arrival" ):
				name  = row[ c ]
		
			if name !="":
				#print( "%s: %s" % ( col_name, row[ c ] ) )
				write_entry_context( dst_num, Id_C, type_, name, map_record, mapping )

		Id_C1 = context_num
		relation = ""	# for ORG_CONTEXT in general no relation for our data
		write_entry_org_context( dst_num, Id_C1, relation, mapping )

	else:
		print( "src_db_table: %s ??" % src_db_table )
		print( "EXIT in do_context_das()" )
		exit( 0 )
# do_context_das()



def do_context_default( t, dst_num, context_num, row, src_col_names, mapping ):
	if debug: print( "do_context_default()" )
	
	context = get_context( row, src_col_names )
	if debug: print( "context:", context )
#	write_entry_context_basic( dst_num, context_num, context, mapping )
	
	ncontexts = len( cnames_nl )
	for c in range( ncontexts ):
		cname_nl = cnames_nl[ c ]
		cname_us = cnames_us[ c ]
		value    = context[ cname_nl ]
		Id_C     = context_num + c
		
		if value is None:
			value = ""
		else:
			value = str( value )
		
		if debug: print( "c: %s, cname_nl: %s, cname_us: %s, value: %s, Id_C: %s" % 
			( c, cname_nl, cname_us, value, Id_C ) )
		if value is not None and value != "":
			map_record = {}
			try:
				map_record = mapping[ col_name ]
			except:
				pass
				
			write_entry_context( dst_num, Id_C, cname_us, value, map_record, mapping )
		
		if c < ncontexts-1:		# skip the last-to-first context_context
			relation = cnames_us[ c ] + "_and_" + cnames_us[ c+1 ]
			Id_C1 = Id_C
			Id_C2 = Id_C + 1
			#print( "context_context", Id_C1, Id_C2 )
			write_entry_context_context( dst_num, Id_C1, Id_C2, relation, mapping )
		
		if c == 0:
			relation = ""	# for ORG_CONTEXT in general no relation for our data
			write_entry_org_context( dst_num, Id_C1, relation, mapping )
# do_context_default()



def get_estimation_missing( day, month, year ):
	estimation = ""
	missing    = ""
	
	if year > 0:
		if month > 0:
			if day > 0:
				estimation = "Exact"
			else:
				estimation = "MonthYear"
		else:
			estimation = "Year"
	
	if estimation == "":
		missing = "Date Missing"
	
	return estimation, missing
# get_estimation_missing()



def analyze_date( value, ncomps ):
	day   = 0
	month = 0
	year  = 0
	DE    = DEstimation.Nothing
	
	nhyphens = sum( i == '-' for i in value )
	if debug: print( "analyze_date() value:", value, "nhyphens:", nhyphens )
	
	if nhyphens == 0:
		if ncomps == 1:
			try:
				year = int( value )	# just assume the single component is the year
				DE = DEstimation.Year
			except:
				pass
	
	elif nhyphens == 2:
		dmy = value.split( '-' )
		
		# strip non-digits
		day   = ''.join( i for i in dmy[ 0 ] if i.isdigit() )
		month = ''.join( i for i in dmy[ 1 ] if i.isdigit() )
		year  = ''.join( i for i in dmy[ 2 ] if i.isdigit() )
		
		# need integers
		if day == "": 
			day = 0 
		else: 
			day = int( day )
			
		if month == "": 
			month = 0 
		else: 
			month = int( month )
		
		if year == "": 
			year = 0 
		else: 
			year = int( year )
		
		if year == 0:
			month = 0
			day   = 0
			
		if day == month == year == 0:
			DE = DEstimation.Nothing
		else:
			if year > 0:
				if month > 0:
					if day > 0:
						DE = DEstimation.Exact
					else:
						DE = DEstimation.MonthYear
				else:
					DE = DEstimation.Year
	
#	print( "analyze_date:", value, day, month, year, DE )
	return day, month, year, DE
# analyze_date()



def get_id( order_by, col_names, row ):
	Id_O = None
	ncols = len(src_col_names  )
	for c in range( ncols ):
		col_name = col_names [ c ]
		if col_name == order_by:
			Id_O = row[ c ]
			if Id_O is not None:
				Id_O = int( Id_O )
	return Id_O
# get_id()



def process_src_table( t, src_col_names, src_count, mapping ):
	if debug: print( "process_src_table()" )
	src_db_table = src_db_tables[ t ]
	
	order_by = Id_O_col[ t ]
	
	sql = "SELECT * FROM `" + src_db_name + "`.`" + src_db_table + "`"
	if order_by != "":
		sql += " ORDER BY " + order_by
	sql += ";"
	if debug: print( sql )
	
	src_cursor.execute( sql )
	rows = src_cursor.fetchall ()
	
	row_idx  = 0	# source row
	cell_idx = 0	# context cell
	for row in rows:
		row_num = row_idx  + 1
		
		Id_O = row_num		# default
		if order_by != "":
			Id_O = get_id( order_by, src_col_names, row )
			#print( "Id_O:", Id_O )
		dst_num = dst_offset + Id_O
		
		cell_num = cell_idx + 1
		context_num = cell_num + dst_offset
		#print( "process_src_table() dst_row_num:", dst_num, '\n', row, "\n" )
		
		timestamp = get_timestamp( row, src_col_names )
		src_str = { "timestamp" : timestamp }
		#print( "process_src_table()", src_str )
		#continue
	
		mapping[ "src" ] = src_str		# fixed strings for each meso record
		if debug: print( "mapping:", mapping )
		
		# context
		ncontexts = len( cnames_nl )
		if db_source == "das":
			do_context_das( t, dst_num, context_num, row, src_col_names, mapping )
		else:
			do_context_default( t, dst_num, context_num, row, src_col_names, mapping )
		
		if t == 0:	# write TYPE_ORGANIZATION only once (for main table)
			# write TYPE_ORGANIZATION before other ids records
			if mapping[ "Type_Org" ] != "":		# only non-empty for 1st table of a set
				write_type_org( dst_num, mapping )
		
		if debug: print( "\nsrc row:", row )
		process_src_row( t, dst_num, row, src_col_names, mapping )
		
		row_idx += 1
		cell_idx += ncontexts
		
		chunk = 1000
		if ( row_num + chunk ) % chunk == 0:
			print( "%s record %d-of-%d" % ( src_db_table, row_num, src_count ) )
		
		if nrecords is not None and row_idx >= nrecords:
			pass
			print( "BREAK in src_read_table()\n" )
			break
		
	print( "%s record %d-of-%d" % ( map_tables_col1[ 0 ], row_num, src_count ) )
# process_src_table()



def process_src_table_orgts( t, src_col_names, src_count, mapping ):
	print( "process_src_table_orgts()" )
	src_db_table = src_db_tables[ t ]
	print( src_db_table )
	
	order_by = Id_O_col[ t ]
	
	sql = "SELECT * FROM `" + src_db_name + "`.`" + src_db_table + "`"
	if order_by != "":
		sql += " ORDER BY " + order_by
	sql += ";"
	if debug: print( sql )
	
	src_cursor.execute( sql )
	rows = src_cursor.fetchall ()
	
	row_idx  = 0	# source row
	cell_idx = 0	# context cell
	for row in rows:
		if debug: print( "old src col:", src_col_names )
		if debug: print( "src row:", row )
		row_num = row_idx  + 1
		
		Id_O = row_num		# default
		if order_by != "":
			Id_O = get_id( order_by, src_col_names, row )
			#print( "Id_O:", Id_O )
		dst_num = dst_offset + Id_O
		
		cell_num = cell_idx + 1
		context_num = cell_num + dst_offset
		#print( "process_src_table_orgts() dst_row_num:", dst_num, '\n', row, "\n" )
		
		type_ = "TYPE_ORGANIZATION"
		timestamp = get_timestamp_organization( dst_num, type_ )
		src_str = { "timestamp" : timestamp }
		if debug: print( "process_src_table_orgts()", src_str )
		
		mapping[ "src" ] = src_str		# fixed strings for each meso record
		if debug: print( "mapping:", mapping )
		
		# context
		ncontexts = len( cnames_nl )
		if db_source == "das":
			do_context_das( t, dst_num, context_num, row, src_col_names, mapping )
		else:
			do_context_default( t, dst_num, context_num, row, src_col_names, mapping )
		
		if t == 0:	# write TYPE_ORGANIZATION only once (for main table)
			# write TYPE_ORGANIZATION before other ids records
			if mapping[ "Type_Org" ] != "":		# only non-empty for 1st table of a set
				write_type_org( dst_num, mapping )
		
		process_src_row( t, dst_num, row, src_col_names, mapping )
		
		row_idx += 1
		cell_idx += ncontexts
		
		chunk = 1000
		if ( row_num + chunk ) % chunk == 0:
			print( "%s record %d-of-%d" % ( src_db_table, row_num, src_count ) )
		
		if nrecords is not None and row_idx >= nrecords:
			pass
			print( "BREAK in src_read_table()\n" )
			break
		
		#print( "EXIT in process_src_table_orgts()" )
		#exit( 0 )
		
	print( "%s record %d-of-%d" % ( map_tables_col1[ 0 ], row_num, src_count ) )
# process_src_table_orgts()



def delete_previous( ids_db_name, Source ):
	# cleanup previous data
	
	ids_table_names = [ "CONTEXT", "CONTEXT_CONTEXT", "INDIVIDUAL", "INDIV_CONTEXT", 
		"INDIV_ORG", "ORGANIZATION", "ORG_CONTEXT", "ORG_ORG" ]
	
	for ids_table_name in ids_table_names:
		sql  = "DELETE FROM `" + ids_db_name + "`.`" + ids_table_name + "`"
		sql += " WHERE Source = '" + Source + "';"
			
		print( sql )
		try:
			ids_cursor.execute( sql )
			ids_db.commit()
		except:
			type, value, tb = exc_info()
			msg = "Exception in write_type_org(): %s" % value
			print( "%s\n" % msg )
			print( sql )
			exit( 1 )
# delete_previous()



def format_secs( seconds ):
	nmin, nsec  = divmod( seconds, 60 )
	nhour, nmin = divmod( nmin, 60 )

	if nhour > 0:
		str_elapsed = "%d:%02d:%02d (hh:mm:ss)" % ( nhour, nmin, nsec )
	else:
		if nmin > 0:
			str_elapsed = "%02d:%02d (mm:ss)" % ( nmin, nsec )
		else:
			str_elapsed = "%d (sec)" % nsec

	return str_elapsed
# format_secs()



if __name__ == "__main__":
	time0 = time()		# seconds since the epoch
	map_name1 = map_tables_col1[ 0 ]
	
	Source   = get_source( src_db_name, map_db_table, map_name1 )
	Type_Org = get_typorg( src_db_name, map_db_table, map_name1 )
#	Org_Id_C = get_orgidc( src_db_name, map_db_table, map_name1 )

	if do_delete_previous:	# delete previous meso data for given source
		delete_previous( ids_db_name, Source )
	else:
		print( "NOT deleting previous data" )
	
	if db_source == "zeemonster":
		print( "Skipping processing zeemonster" )
		print( "EXIT" )
		exit( 0 )
	
	ntables = len( src_db_tables )
	print( "Number of source tables: %d" % ntables )
	
	for t in range( ntables ):
		time1 = time()		# seconds since the epoch
		
		print( "\n------------------------------------------------------------------" )
		src_db_table = src_db_tables[ t ]
		print( "db: %s, table %d-of-%d: %s" % ( src_db_name, t+1, len(src_db_tables), src_db_table ))
		
		#if t != 0: continue
		
		table_name = src_db_tables[ t ]
		#if table_name != "solrimport": continue			# 5_migranten
		#if table_name != "tblorganisatie": continue		# 5_migranten
		#if table_name != "tblpersoon": continue			# 5_migranten
		#if table_name != "tblkoppelpersorg": continue		# 5_migranten
		
		#if table_name != "tblActiesNew": continue			# 7_stakingen
		#if table_name != "tblActies_Aantallen": continue	# 7_stakingen
		#if table_name != "tblActies_Beroep": continue		# 7_stakingen
		#if table_name != "tblActies_Bron": continue		# 7_stakingen
		#if table_name != "tblActies_Plaats": continue		# 7_stakingen
		#if table_name != "tblActies_Bedrijf": continue		# 7_stakingen
		#if table_name != "tblActies_Plaats": continue		# 7_stakingen
		
		src_col_names = get_src_col_names( src_db_table )
		print( src_col_names )
		
		src_count = get_src_row_count( src_db_table )
		print( src_count, "records in", src_db_name + "." + src_db_table )
		
		mapping = get_mappings( src_db_table, src_col_names )
		
		if t == 0:
			mapping[ "Type_Org" ] = Type_Org
		#	mapping[ "Org_Id_C" ] = Org_Id_C
			
		else:
			mapping[ "Type_Org" ] = ""
		#	mapping[ "Org_Id_C" ] = ""
		
		mapping[ "Source" ]    = Source
		mapping[ "Id_D" ]      = "IDS-MESO Demonstrator 2015.01"
		mapping[ "Date_type" ] = "Declared"
		
		if debug: print( "mapping:\n", mapping )
		
		if ( ( db_source == "migranten" and table_name == "tblorganisatie" ) or
			 ( db_source == "stakingen" and 
				table_name in [ "tblActies_Aantallen", "tblActies_Beroep", "tblActies_Bron", "tblActies_Plaats", "tblActies_Bedrijf" ] ) ):
			# get timestamp from table ORGANIZATION
			process_src_table_orgts( t, src_col_names, src_count, mapping )
		else:
			process_src_table( t, src_col_names, src_count, mapping )
		
		print( "skipped missing key entries (empty columns?) for src columns:\n", missing_keys )
		
		get_row_counts( ids_db_name, Source )
		
		str_elapsed = format_secs( time() - time1 )
		print( "Table %s in %s" % ( table_name, str_elapsed ) )
				
	src_cursor.close()
	ids_cursor.close()
	
	str_elapsed = format_secs( time() - time0 )
	print( "All %d tables in %s" % ( ntables, str_elapsed ) )
	
# [eof]
