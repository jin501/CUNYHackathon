# assuming we have the curriculum or the major within an
# item: key format
curriculum = {
  'CS100': {
    'credits': 3,
    'prereqs': []
  },
  'CS135': {
    'credits': 3,
    'prereqs': ['CS100']
  },
  'CS150': {
    'credits': 3,
    'prereqs': ['CS100', 'MATH150']
  }
}

electives = {
  'PSYCH100': {
    'credits': 3,
    'prereqs': []
  },
  'GEO100': {
    'credits': 4,
    'prereqs': []
  },
  'ASTRO110': {
    'credits': 4,
    'prereqs': []
  }
}

# array/list of courses taken by user - NEEDS TO BE AN ITERABLE LIST
taken_courses_array = ['CS100', 'PHILO210', 'ENG120']

max_credits = 15
min_credits = 12


def advise():
  next_sem = [] # an array which will be passed to client
  credit_counter = 0

  # iterate through curriculum data - NEEDS AN ITERABLE LIST OF COURSES
  for course in curriculum:
    # if this course is going to cause exceeding of max_credits, skip it
    if credit_counter + curriculum[course]['credits'] > max_credits:
      continue

    # if this course has been taken, skip it
    if course in taken_courses_array:
      continue
    else:
      prereqs_met = True # a bool to determine if all preqs met or not

      # iterate through prereqs list of current course
      # curriculum_list.course.prereq_array - NEEDS A LIST OF ALL PREREQS TO THIS COURSE
      for prereq in curriculum[course]['prereqs']:
        # if a prereq hasn't been taken
        if prereq not in taken_courses_array:
          next_sem.append(prereq) # add to next_sem courses
          credit_counter += curriculum[course]['credits'] 
            # NOTE: this should actually use the num credits on the PREREQ itself
          prereqs_met = False # set bool to false for next step

      # if the bool is still true, then append course to next_sem      
      if prereqs_met == True:
        next_sem.append(course)
        credit_counter += curriculum[course]['credits']

    # if at the end of choosing major courses, not enough credits
    if credit_counter < min_credits:
      # iterate through a list of elective courses
      for elective in electives:
        # if elective course is going to cause exceeding of max_credits, skip it
        if credit_counter + electives[elective]['credits'] > max_credits:
          continue

        if elective in taken_courses_array:
          continue

        # else, add it to next_sem list
        next_sem.append(elective)
        credit_counter += electives[elective]['credits']


  print(next_sem)
  print(credit_counter)


advise()