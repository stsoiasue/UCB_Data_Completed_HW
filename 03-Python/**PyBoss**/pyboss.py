### this file will take in employee data, reformat and create a new csv file with the reformatted data
import csv

employee_file = input('where is your file located? (drag into the terminal window): ')
employee_file = employee_file.strip()

# create lists to hold employee information
emp_id = []
f_name = []
l_name = []
dob = [] 
ssn = []
abbr_state = []

# dictionary of US states and corresponding abbreviations
us_state_abbrev = {
    'Alabama': 'AL',
    'Alaska': 'AK',
    'Arizona': 'AZ',
    'Arkansas': 'AR',
    'California': 'CA',
    'Colorado': 'CO',
    'Connecticut': 'CT',
    'Delaware': 'DE',
    'Florida': 'FL',
    'Georgia': 'GA',
    'Hawaii': 'HI',
    'Idaho': 'ID',
    'Illinois': 'IL',
    'Indiana': 'IN',
    'Iowa': 'IA',
    'Kansas': 'KS',
    'Kentucky': 'KY',
    'Louisiana': 'LA',
    'Maine': 'ME',
    'Maryland': 'MD',
    'Massachusetts': 'MA',
    'Michigan': 'MI',
    'Minnesota': 'MN',
    'Mississippi': 'MS',
    'Missouri': 'MO',
    'Montana': 'MT',
    'Nebraska': 'NE',
    'Nevada': 'NV',
    'New Hampshire': 'NH',
    'New Jersey': 'NJ',
    'New Mexico': 'NM',
    'New York': 'NY',
    'North Carolina': 'NC',
    'North Dakota': 'ND',
    'Ohio': 'OH',
    'Oklahoma': 'OK',
    'Oregon': 'OR',
    'Pennsylvania': 'PA',
    'Rhode Island': 'RI',
    'South Carolina': 'SC',
    'South Dakota': 'SD',
    'Tennessee': 'TN',
    'Texas': 'TX',
    'Utah': 'UT',
    'Vermont': 'VT',
    'Virginia': 'VA',
    'Washington': 'WA',
    'West Virginia': 'WV',
    'Wisconsin': 'WI',
    'Wyoming': 'WY',
}

# function to reformat date to mm/dd/yyyy
def reformat_date(date):

    new_date = '/'.join((date[5:7] , date[8:10] , date[:4]))

    return new_date

# function to hide first 5 numbers in ssn
def hide_ssn(ssn):

    new_ssn = ''.join(('***-**-', ssn[-4:]))

    return new_ssn

with open(employee_file, newline='') as csvfile:

    employee_file_rows = csv.reader(csvfile, delimiter=',')

    #  add data to months and revenues lists
    for row in employee_file_rows:
        
        # add employee id to emp_id list 
        emp_id.append(row[0])
        
        # split name into first and last name
        name = row[1].split(' ', 1)

        if len(name) > 1:

            # add to f_name list
            f_name.append(name[0])
            
            # add to f_name list
            l_name.append(name[1])

        # add reformatted date to dob list
        dob.append(reformat_date(row[2]))

        # add hidden ssn to ssn list
        ssn.append(hide_ssn(row[3]))

        if row[4] in us_state_abbrev:
        
            # add state abbreviation to state list
            abbr_state.append(us_state_abbrev[row[4]])

# remove headers from list
del emp_id[0]
del dob[0]
del ssn[0]

new_employee_data = zip(emp_id, f_name, l_name, dob, ssn, abbr_state)

# print to to csv
new_employee_file = 'new_employee_data.csv'

# Open the file using "write" mode. Specify the variable to hold the contents
with open(new_employee_file, 'w', newline='') as csvfile:

    # Initialize csv.writer
    csvwriter = csv.writer(csvfile, delimiter=',')

    # Write the first row (column headers)
    csvwriter.writerow(['Emp ID', 'First Name', 'Last Name', 'DOB', 'SSN', 'State'])

    # loop through zipped list to write employee info to new csv
    for employee in new_employee_data:

        csvwriter.writerow(employee)
    
    csvfile.close()
