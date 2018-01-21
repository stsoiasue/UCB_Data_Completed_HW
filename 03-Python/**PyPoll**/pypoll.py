### this file will review bank revenue data and print analysis to a text file

import csv

election_file = input('where is your file located? (drag into the terminal window): ')
election_file = election_file.strip()

# less one for header
total_votes = -1 

# create list to hold candidates
candidates = {}

with open(election_file, newline='') as csvfile:

    election_file_rows = csv.reader(csvfile, delimiter=',')

    for row in election_file_rows:

        total_votes += 1

        if row[2] not in candidates:

            # add candidate to candidates list
            candidates[row[2]] = 1

        else:

            # add to candidate vote count
            candidates[row[2]] += 1

# remove header from candidates dictionary
del candidates['Candidate']

winning_vote_count = 0
winners = []

for key in candidates:

    # check if candidate has most votes
    if candidates[key] > winning_vote_count:
        
        # clear previous winner
        winners = []

        # add winner to list
        winners.append(key)

        # update winning vote count
        winning_vote_count = candidates[key]

    # check if there is a tie
    elif candidates[key] == winning_vote_count:

        # add to winners list
        winners.append(key)

# print analysis to terminal
print('```')
print('Election Results')
print('-------------------------')
print('Total Votes: ' + str(total_votes))
print('-------------------------')

for key in candidates:

    # calculate percentage_of_vote
    percentage_of_vote = round((candidates[key] / total_votes) * 100, 2)

    print(key + ': ' + str(percentage_of_vote) + '% (' + str(candidates[key]) + ')')

print('-------------------------')
    
for name in winners:

    print('Winner(s): ' + name)

print('-------------------------')
print('```')

# print to to text file
output_file = 'vote_analyis.txt'

with open(output_file, 'w') as txtfile:

    txtfile.write('```\n')
    txtfile.write('Election Results\n')
    txtfile.write('-------------------------\n')
    txtfile.write('Total Votes: ' + str(total_votes) + '\n')
    txtfile.write('-------------------------\n')

    for key in candidates:

        # calculate percentage_of_vote
        percentage_of_vote = round((candidates['Khan'] / total_votes) * 100, 2)

        txtfile.write(key + ': ' + str(percentage_of_vote) + '% (' + str(candidates[key]) + ')\n')

    txtfile.write('-------------------------\n')
        
    for name in winners:

        txtfile.write('Winner(s): ' + name + '\n')

    txtfile.write('-------------------------\n')
    txtfile.write('```\n')

    txtfile.close()



