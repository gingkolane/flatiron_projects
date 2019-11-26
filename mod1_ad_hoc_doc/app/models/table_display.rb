

  # display an array of studies in table
  def display_study_table(studies)

    # 1. create a study table
    # table = TTY::Table.new ['header1','header2'], [['a1', 'a2'], ['b1', 'b2']]
    study_header = [
      "OFFICIAL_TITLE",
      "BRIEF_SUMMARY",
      "PHASE",
      "CRITERIA",
      "MINIMUM_AGE",
      "MAXIMUM_AGE",
      "GENDER",
      "START_DATE",
      "TARGET_DURATION",
      "PRIMARY_COMPLETION_DATE",
      "COMPLETION_DATE",
      "ENROLLMENT",
      "ENROLLMENT_TYPE",
      "NCT_ID"
      ]

    study_array = studies.map do |study|
      puts
      "#{study.FACILITY_NAME}, 
      #{study.OFFICIAL_TITLE},
      #{study.BRIEF_SUMMARY},
      #{study.PHASE},
      #{study.CRITERIA},
      #{study.MINIMUM_AGE},
      #{study.MAXIMUM_AGE},
      #{study.GENDER},
      #{study.START_DATE},
      #{study.TARGET_DURATION},
      #{study.PRIMARY_COMPLETION_DATE},
      #{study.COMPLETION_DATE},
      #{study.ENROLLMENT},
      #{study.ENROLLMENT_TYPE},
      #{study.NCT_ID}"
    end 

    studytable = TTY::Table.new study_header, study_array

    #2. call renderer on this table
    studytable.render(:ascii)
  end

  def self.facility_table(facilities)

    # 1. create a facility table
    # table = TTY::Table.new ['header1','header2'], [['a1', 'a2'], ['b1', 'b2']]
    facility_header = [
      'FACILITY_NAME',
      'CITY',
      'STATE',
      'ZIP',
      'COUNTRY'
    ]

    facility_array = facilities.map do |facility| 
      puts
        "#{facility.FACILITY_NAME}, 
        #{facility.CITY}, 
        #{facility.STATE}, 
        #{facility.ZIP}, 
        #{facility.COUNTRY}"
    end

    facilitytable = TTY::Table.new facility_header, facility_array

    #2. call renderer on this table
    facility_table.render(:ascii)
  end

