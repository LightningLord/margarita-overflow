module AnswersHelper
  def answer_count(question)
    answers = question.answers.count
    if answers == 1
      "#{answers} answer"
    else
      "#{answers} answers"
    end
  end
end
