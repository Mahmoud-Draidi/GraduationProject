// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class FAQ {
  int? id;
  String? question;
  String? answer;
  FAQ({
    this.id,
    this.question,
    this.answer,
  });

  FAQ copyWith({
    int? id,
    String? question,
    String? answer,
  }) {
    return FAQ(
      id: id ?? this.id,
      question: question ?? this.question,
      answer: answer ?? this.answer,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'question': question,
      'answer': answer,
    };
  }

  factory FAQ.fromMap(Map<String, dynamic> map) {
    return FAQ(
      id: map['id'] != null ? map['id'] as int : null,
      question: map['question'] != null ? map['question'] as String : null,
      answer: map['answer'] != null ? map['answer'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory FAQ.fromJson(String source) =>
      FAQ.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'FAQ(id: $id, question: $question, answer: $answer)';

  @override
  bool operator ==(covariant FAQ other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.question == question &&
        other.answer == answer;
  }

  @override
  int get hashCode => id.hashCode ^ question.hashCode ^ answer.hashCode;
}
