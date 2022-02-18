import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Form Validation Demo';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  var genderOptions = ['Male', 'Female', 'Others'];

  /*  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              hintText: 'Enter your name',
              labelText: 'Name',
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(  
            decoration: const InputDecoration(  
              icon:  Icon(Icons.phone),  
              hintText: 'Enter a phone number',  
              labelText: 'Phone',  
            ),
            validator: (value) {
              if (value == null || value.isEmpty || value.length < 10 ) {
                return 'Please enter phone number';
              }
              return null;
            },  
          ),  
          TextFormField(  
            decoration: const InputDecoration(  
            icon:  Icon(Icons.calendar_today),  
            hintText: 'Enter your date of birth',  
            labelText: 'Dob',  
            ),  
           ),  
          ElevatedButton(
            onPressed: () {
              // Validate returns true if the form is valid, or false otherwise.
              if (_formKey.currentState!.validate()) {
                // If the form is valid, display a snackbar. In the real world,
                // you'd often call a server or save the information in a database.
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data')),
                );
              }
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
} */
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FormBuilder(
          key: _formKey,
          //autovalidateMode: AutovalidateMode.always,
          child: Column(
            children: <Widget>[
              FormBuilderFilterChip(
                name: 'filter_chip',
                decoration: const InputDecoration(
                  labelText: "Select many options",
                ),
                options: const [
                  FormBuilderFieldOption(value: 'Test', child: Text('Test')),
                  FormBuilderFieldOption(
                      value: 'Test 1', child: Text('Test 1')),
                  FormBuilderFieldOption(
                      value: 'Test 2', child: Text('Test 2')),
                  FormBuilderFieldOption(
                      value: 'Test 3', child: Text('Test 3')),
                  FormBuilderFieldOption(
                      value: 'Test 4', child: Text('Test 4')),
                ],
              ),
              FormBuilderChoiceChip(
                name: 'choice_chip',
                decoration: const InputDecoration(
                  labelText: 'Select an option',
                ),
                options: const [
                  FormBuilderFieldOption(value: 'Test', child: Text('Test')),
                  FormBuilderFieldOption(
                      value: 'Test 1', child: Text('Test 1')),
                  FormBuilderFieldOption(
                      value: 'Test 2', child: Text('Test 2')),
                  FormBuilderFieldOption(
                      value: 'Test 3', child: Text('Test 3')),
                  FormBuilderFieldOption(
                      value: 'Test 4', child: Text('Test 4')),
                ],
              ),
              FormBuilderDateTimePicker(
                name: 'date',
                // onChanged: _onChanged,
                inputType: InputType.time,
                decoration: const InputDecoration(
                  labelText: 'Appointment Time',
                ),
                initialTime: const TimeOfDay(hour: 8, minute: 0),
                // initialValue: DateTime.now(),
                // enabled: true,
              ),
              FormBuilderDateRangePicker(
                name: 'date_range',
                firstDate: DateTime(1970),
                lastDate: DateTime(2030),
                //format: DateFormat('yyyy-MM-dd'),
                //onChanged: _onChanged,
                decoration: const InputDecoration(
                  labelText: 'Date Range',
                  helperText: 'Helper text',
                  hintText: 'Hint text',
                ),
              ),
              FormBuilderSlider(
                name: 'slider',
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.min(context, 6),
                ]),
                //onChanged: _onChanged,
                min: 0.0,
                max: 10.0,
                initialValue: 7.0,
                divisions: 20,
                activeColor: Colors.red,
                inactiveColor: Colors.pink[100],
                decoration: const InputDecoration(
                  labelText: 'Number of things',
                ),
              ),
              FormBuilderCheckbox(
                name: 'accept_terms',
                initialValue: false,
                //onChanged: _onChanged,
                title: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'I have read and agree to the ',
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: 'Terms and Conditions',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ),
                validator: FormBuilderValidators.equal(
                  context,
                  true,
                  errorText: 'You must accept terms and conditions to continue',
                ),
              ),
              FormBuilderTextField(
                name: 'age',
                decoration: const InputDecoration(
                  labelText:
                      'This value is passed along to the [Text.maxLines] attribute of the [Text] widget used to display the hint text.',
                ),
                //onChanged: _onChanged,
                // valueTransformer: (text) => num.tryParse(text),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(context),
                  FormBuilderValidators.numeric(context),
                  FormBuilderValidators.max(context, 70),
                ]),
                keyboardType: TextInputType.number,
              ),
              FormBuilderDropdown(
                name: 'gender',
                decoration: const InputDecoration(
                  labelText: 'Gender',
                ),
                // initialValue: 'Male',
                allowClear: true,
                hint: const Text('Select Gender'),
                validator: FormBuilderValidators.compose(
                    [FormBuilderValidators.required(context)]),
                items: genderOptions
                    .map((gender) => DropdownMenuItem(
                          value: gender,
                          child: Text(gender),
                        ))
                    .toList(),
              ),
            ],
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: MaterialButton(
                color: Theme.of(context).colorScheme.secondary,
                child: const Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  _formKey.currentState?.save();
                  bool? t = _formKey.currentState?.validate();
                  if (t == true) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Incorrect Data')));
                  }
                },
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: MaterialButton(
                color: Theme.of(context).colorScheme.secondary,
                child: const Text(
                  "Reset",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  _formKey.currentState?.reset();
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}
