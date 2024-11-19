import 'package:isar/isar.dart';
import 'package:online_exam/features/questions/data/models/online/question_response_model.dart';
import 'package:online_exam/features/questions/domain/entities/checked_exam.dart';
import 'package:online_exam/features/questions/domain/entities/question.dart';

part 'checked_exam_table_model.g.dart';


@collection
class CheckedExamTableModel {
  Id? id; // Nullable auto-incrementing ID for Isar

  String? examId;
  String? title;
  int? duration;
  String? subject;
  int? numberOfQuestions;
  bool? active;

  List<CheckedQuestionTable>? checkedQuestions;
  List<SelectedAnswersTable>? checkAnswers;

  // Constructor with nullable attributes
  CheckedExamTableModel({
    this.id,
    this.examId,
    this.title,
    this.duration,
    this.subject,
    this.numberOfQuestions,
    this.active,
    this.checkedQuestions,
    this.checkAnswers,
  });

  // Converts from domain model (CheckedExam) to Isar model
  factory CheckedExamTableModel.fromModel(CheckedExam model) {
    return CheckedExamTableModel(
      examId: model.id,
      title: model.title,
      duration: model.duration,
      subject: model.subject,
      numberOfQuestions: model.numberOfQuestions,
      active: model.active,
      checkedQuestions: model.checkedQuestions
          .map((question) => CheckedQuestionTable.fromModel(question))
          .toList(),
      checkAnswers: model.checkAnswers
          .map((answer) => SelectedAnswersTable.fromModel(answer))
          .toList(),
    );
  }

  // Converts from Isar model to domain model (CheckedExam)
  CheckedExam toModel() {
    return CheckedExam(
      id: examId ?? '',
      title: title ?? '',
      duration: duration ?? 0,
      subject: subject ?? '',
      numberOfQuestions: numberOfQuestions ?? 0,
      active: active ?? false,
      checkedQuestions: checkedQuestions
          ?.map((question) => question.toModel())
          .toList() ??
          [],
      checkAnswers: checkAnswers
          ?.map((answer) => answer.toModel())
          .toList() ??
          [],
    );
  }
}

@embedded
class CheckedQuestionTable {
  List<CheckedQuestionAnswers>? answers;
  String? type;
  String? id;
  String? question;
  String? correct;

  CheckedQuestionTable({
    this.answers,
    this.type,
    this.id,
    this.question,
    this.correct,
  });

  // Converts from domain model (Question) to Isar model
  factory CheckedQuestionTable.fromModel(Question model) {
    return CheckedQuestionTable(
      answers: model.answers
          .map((answer) => CheckedQuestionAnswers.fromModel(answer))
          .toList(),
      type: model.type,
      id: model.id,
      question: model.question,
      correct: model.correct,
    );
  }

  // Converts from Isar model to domain model (Question)
  Question toModel() {
    return Question(
      answers: answers?.map((answer) => answer.toModel()).toList() ?? [],
      type: type ?? '',
      id: id ?? '',
      question: question ?? '',
      correct: correct ?? '',
      exam: null, // Populate if needed
    );
  }
}

@embedded
class CheckedQuestionAnswers {
  String? answer;
  String? key;

  CheckedQuestionAnswers({
    this.answer,
    this.key,
  });

  // Converts from domain model (QuestionAnswers) to Isar model
  factory CheckedQuestionAnswers.fromModel(QuestionAnswers model) {
    return CheckedQuestionAnswers(
      answer: model.answer,
      key: model.key,
    );
  }

  // Converts from Isar model to domain model (QuestionAnswers)
  QuestionAnswers toModel() {
    return QuestionAnswers(
      answer: answer ?? '',
      key: key ?? '',
    );
  }
}

@embedded
class SelectedAnswersTable {
  String? questionId;
  String? correct;

  SelectedAnswersTable({
    this.questionId,
    this.correct,
  });

  // Converts from domain model (CheckAnswers) to Isar model
  factory SelectedAnswersTable.fromModel(CheckAnswers model) {
    return SelectedAnswersTable(
      questionId: model.questionId,
      correct: model.correct,
    );
  }

  // Converts from Isar model to domain model (CheckAnswers)
  CheckAnswers toModel() {
    return CheckAnswers(
      questionId: questionId,
      correct: correct,
    );
  }
}
