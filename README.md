# MCW_Doc

This is the mod1 project for my coding bootcamp in Flatiron. It is a joint project of Miles, Wei and me. It is written in ruby. Data source is clinicaltrials.gov in sqlite3 database.  

A basic cli program generates a greeting interface, gives the user a random disease, then refers a list of doctors to the user, and user can choose a doctor. 

To run the program, 

ruby cli.rb


Database structure in this project is the original structure of clincaltrials.gov, where a NCT_ID is used as primary key for all the data models. It shows an example of ruby query data from database without using active record. 

For example: 

#active record
condition.studies

required structure:
conditions, studies, conditions_study


#standard structure, all table has a nct_id

class Condition < ApplicationRecord

  def find_studies
    Study.where(NCT_ID: self.NCT_ID)
  end

We used rails backend for the data we had, but it was not used in the final presentation. In the end, only one file cli.rb is used.


