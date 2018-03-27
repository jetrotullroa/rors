module Dashboard::ExerciseHelper

  def format_workout_date(date)
    d = Date.strptime("#{date}", '%Y-%m-%d')
    d.strftime('%d %B %Y')
  end

end
