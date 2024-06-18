import 'package:dummy_template/values/text_style.dart';
import 'package:flutter/material.dart';

class Pictures {
  final String images;
  final String content;
  final String text;

  Pictures(this.images, this.content, this.text);
}

List<Pictures> picture = [
  Pictures(
      'assets/images/WomanDrink.png',
      'Track your daily water intake with Us.',
      'Achieve your hydration goals with a simple tap!'),
  Pictures('assets/images/ManDrink.png', 'Smart Reminders Tailored to You',
      'Quick and easy to set your hydration goal & then track your daily water intake progress.'),
  Pictures('assets/images/Bottle.png', 'Easy to Use – Drink, Tap, Repeat',
      'Staying hydrated every day is easy with Drops Water Tracker.'),
];

class Verticals {
  final double percent;

  Verticals(this.percent);
}

List<Verticals> verticalSlide = [
  Verticals(1),
  Verticals(0.7),
  Verticals(0.5),
  Verticals(0.6),
  Verticals(0.4),
  Verticals(0),
  Verticals(0),
  Verticals(0),
];

class SettingTexts {
  final String info;
  final String detail;
  final TextStyle textStyle;

  SettingTexts(this.info, this.detail, this.textStyle);
}

List<SettingTexts> settingText = [
  SettingTexts('Reminder Settings', '',
      poppins.copyWith(fontSize: 16, fontWeight: FontWeight.bold)),
  SettingTexts('Reminder Sound', '', poppins),
  SettingTexts('Reminder Mode', 'As device settings', poppins),
  SettingTexts('General', '',
      poppins.copyWith(fontSize: 16, fontWeight: FontWeight.bold)),
  SettingTexts('Remove ADS', '', poppins),
  SettingTexts('Light or dark interface', 'Light', poppins),
  SettingTexts('Unit', 'Kg. ml', poppins),
  SettingTexts('Intake goal', '2000 ml', poppins)
];

class HistoryTexts {
  final String image;
  final String day;

  HistoryTexts(this.image, this.day);
}

List<HistoryTexts> historyText = [
  HistoryTexts('assets/icons/Checked.png', 'Sun'),
  HistoryTexts('assets/icons/Checked.png', 'Mon'),
  HistoryTexts('assets/icons/Checked.png', 'Tue'),
  HistoryTexts('assets/icons/Checked.png', 'Wed'),
  HistoryTexts('assets/icons/Checked.png', 'Thu'),
  HistoryTexts('assets/icons/ToDay.png', 'Fri'),
  HistoryTexts('assets/icons/UnCheck.png', 'Sat'),
];

class AmountWaters {
  final String amount1;
  final String amount2;
  final Container container;

  AmountWaters(this.amount1, this.amount2, this.container);
}

List<AmountWaters> amountWater = [
  AmountWaters(
      'Weekly Average',
      '0 ml / Day',
      Container(
          width: 7,
          height: 7,
          decoration: const BoxDecoration(
              color: Colors.green, shape: BoxShape.circle))),
  AmountWaters(
      'Monthly Average',
      '0 ml / Day',
      Container(
          width: 7,
          height: 7,
          decoration:
              const BoxDecoration(color: Colors.blue, shape: BoxShape.circle))),
  AmountWaters(
      'Average Completion',
      '0%',
      Container(
          width: 7,
          height: 7,
          decoration: const BoxDecoration(
              color: Colors.orange, shape: BoxShape.circle))),
  AmountWaters(
      'Drink Frequency',
      '0 times / Day',
      Container(
          width: 7,
          height: 7,
          decoration:
              const BoxDecoration(color: Colors.red, shape: BoxShape.circle))),
];

class ToDo {
  final String timeText;
  final String amountText;
  final String actIcon;

  ToDo(this.timeText, this.amountText, this.actIcon);
}

List<ToDo> toDo = [
  ToDo('Summer time', '10 Glass', 'assets/icons/Palm.png'),
  ToDo('Sporty', '7 Glass', 'assets/icons/Ball.png'),
  ToDo('Snow day', '5 Glass', 'assets/icons/Snow.png'),
  ToDo('Chill', '4 Glass', 'assets/icons/Rainbow.png'),
];
