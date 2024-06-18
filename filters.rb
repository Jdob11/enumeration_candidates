# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

# {
#   id: 5,
#   years_of_experience: 4,
#   github_points: 293,
#   languages: ['C', 'Ruby', 'Python', 'Clojure'],
#   date_applied: 5.days.ago.to_date,
#   age: 26
# },

def find(id)
  candidates.each do |candidate|
    return candidate if candidate.id == id
  end
  nil
end

def experienced?(candidate)
  candidate[:years_of_experience] >= 2
end

def qualified_candidates(candidates)
  good_candidates = []
  candidates.each do |candidate|
    good_candidates.push(candidate) if qualified?(candidate)
  end
  good_candidates
end

# More methods will go below

def github_over_100?(candidate)
  candidate[:github_points] >= 100
end

def knows_ruby_or_python?(candidate)
  desired_languages = ["Ruby", "Python"]
  (candidate[:languages] & desired_languages).any?
end

def applied_within_15_days?(candidate)
  candidate[:date_applied] >= 15.days.ago.to_date
end

def is_18_or_older?(candidate)
  candidate[:age] >= 18
end

def qualified?(candidate)
  experienced?(candidate) &&
    github_over_100?(candidate) &&
    knows_ruby_or_python?(candidate) &&
    applied_within_15_days?(candidate) &&
    is_18_or_older?(candidate)
end

def ordered_by_qualifications(candidates)
  sorted_candidates = candidates.sort_by do |candidate|
    [-candidate[:years_of_experience], -candidate[:github_points]]
  end
end