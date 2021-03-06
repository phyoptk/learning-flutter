import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateInputField extends StatefulWidget {
  @override
  _DateInputFieldState createState() => _DateInputFieldState();
}

class _DateInputFieldState extends State<DateInputField> {
  TextEditingController _value = TextEditingController();
  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            enabled: false,
            controller: _value,
          ),
        ),
        GestureDetector(
          onTap: _setDate,
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Icon(Icons.event),
          ),
        ),
      ],
    );
  }

  _setDate() async {
    DateTime target = (null == _value.text || _value.text.isEmpty)
        ? DateTime.now()
        : _dateFormat.parse(_value.text);

    DateTime selected = await showDatePicker(
        context: context,
        initialDate: target,
        firstDate: DateTime(1990),
        lastDate: DateTime(2030));

    if (null != selected) {
      setState(() {
        _value.text = _dateFormat.format(selected);
      });
    }
  }
}

class TimeInputField extends StatefulWidget {
  @override
  _TimeInputFieldState createState() => _TimeInputFieldState();
}

class _TimeInputFieldState extends State<TimeInputField> {
  TextEditingController _value = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            enabled: false,
            controller: _value,
          ),
        ),
        GestureDetector(
          onTap: _setTime,
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Icon(Icons.schedule),
          ),
        ),
      ],
    );
  }

  _setTime() async {
    TimeOfDay time =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());

    if (null != time) {
      setState(() {
        _value.text = time.format(context);
      });
    }
  }
}
