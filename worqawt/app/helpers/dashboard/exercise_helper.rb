module Dashboard::ExerciseHelper

  def format_workout_date(date)
    d = Date.strptime('2018-03-04', '%Y-%m-%d')
    d.strftime('%d %B %Y')
  end

end
