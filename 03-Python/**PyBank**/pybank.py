### this file will review bank revenue data and print analysis to a text file

import csv

revenue_file = input('where is your file located? (drag into the terminal window): ')
revenue_file = revenue_file.strip()

# create lists to hold month and revenue data
months = []
revenues = []

with open(revenue_file, newline='') as csvfile:

    revenue_file_rows = csv.reader(csvfile, delimiter=',')

    #  add data to months and revenues lists
    for row in revenue_file_rows:
        
        months.append(row[0])
        revenues.append(row[1])

# remove file headers from lists
del months[0]
del revenues[0]

# change values in revenues list to integers
revenues = [int(i) for i in revenues]

# calculate total months
total_months = len(months)

# calculate total revenue
total_revenue = sum(revenues)

# create a list to hold month to month changes
monthly_change = []

# add month to month changes to monthly_change list
for i in range(len(revenues)-1):

    monthly_change.append((revenues[i + 1]) - revenues[i])

# calculate average monthly_change
avg_monthly_change = sum(monthly_change) / len(monthly_change)

# calculate greatest increase in revenue
greatest_increase = max(revenues)

# retrive month of greatest increase
greatest_increase_month = months[revenues.index(greatest_increase)]

# calculate greatest decrease in revenue
greatest_decrease = min(revenues)

# retrive month of greatest decrease
greatest_decrease_month = months[revenues.index(greatest_decrease)]

# print results to terminal
print('```')
print('Financial Analysis')
print('----------------------------')
print('Total Months: ' + str(total_months))
print('Total Revenue: $' + str(total_revenue))
print('Average Revenue Change: $' + str(avg_monthly_change))
print('Greatest Increase in Revenue: ' + greatest_increase_month + ' $' + str(greatest_increase))
print('Greatest Decrease in Revenue: ' + greatest_decrease_month + ' $' + str(greatest_decrease))
print('```')

# print to to text file
output_file = 'revenue_analyis.txt'

with open(output_file, 'w') as txtfile:

    txtfile.write('```\n')
    txtfile.write('Financial Analysis\n')
    txtfile.write('----------------------------\n')
    txtfile.write('Total Months: ' + str(total_months) + '\n')
    txtfile.write('Total Revenue: $' + str(total_revenue) + '\n')
    txtfile.write('Average Revenue Change: $' + str(avg_monthly_change) + '\n')
    txtfile.write('Greatest Increase in Revenue: ' + greatest_increase_month + ' $' + str(greatest_increase) + '\n')
    txtfile.write('Greatest Decrease in Revenue: ' + greatest_decrease_month + ' $' + str(greatest_decrease) + '\n')
    txtfile.write('```\n')

    txtfile.close()



