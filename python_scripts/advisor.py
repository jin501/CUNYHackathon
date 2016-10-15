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

# array/list of courses taken by user - NEEDS TO BE AN ITERABLE LIST
taken_courses_array = ['CS100', 'PHILO210', 'ENG']

def advise():
  next_sem = [] # an array which will be passed to client

  # iterate through curriculum data - NEEDS AN ITERABLE LIST OF COURSES
  for course in curriculum:
    # if that course has been taken, skip it
    if course in taken_courses_array:
      continue
    else:
      prereqs_met = True # a bool to determine if all preqs met or not

      # iterate through prereqs list of current course
      # curriculum_list.course.prereq_array - NEEDS A LIST OF ALL PREREQS TO THIS COURSE
      for prereq in curriculum[course]['prereqs']:
        # if a prereq hasn't been taken
        if prereq not in taken:
          next_sem.append(prereq) # add to next_sem courses
          prereqs_met = False # set bool to false for next step
      # if the bool is still true, then append course to next_sem      
      if prereqs_met:
        next_sem.append(key)

  print(next_sem)


advise()