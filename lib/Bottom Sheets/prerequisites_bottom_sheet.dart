import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../Detection/detection_screen.dart';
import '../Layout/main_layout.dart';

class PrerequisitesBottomSheet extends StatefulWidget {
  const PrerequisitesBottomSheet({super.key});

  @override
  State<PrerequisitesBottomSheet> createState() => _PrerequisitesScreenState();
}

class _PrerequisitesScreenState extends State<PrerequisitesBottomSheet> {
  final _formKey = GlobalKey<FormBuilderState>();

  void startDetection() {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      final values = _formKey.currentState!.value;

      if (values['agree']) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MainLayout(
              title: "Detection",
              child: DetectionScreen(),
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: BoxDecoration(
        color: Color(0xFFEBE4E4),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 10,
            ),
            decoration: BoxDecoration(
              color: Color(0xFFDEDAE0),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            width: double.infinity,
            child: Text(
              textAlign: TextAlign.center,
              'Prerequisites',
              style: TextStyle(
                color: Color(0xFF3D1A57),
                fontSize: 32,
                fontFamily: 'Inder',
              ),
            ),
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
          Expanded(
            child: SingleChildScrollView(
              child: FormBuilder(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "The following tests are mandatory:",
                        style: TextStyle(
                          fontSize: 22,
                          fontFamily: 'Inder',
                          color: Color(0xFF3D1A57),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 16,
                          top: 12,
                          bottom: 10,
                        ),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 7),
                                  child: Text(
                                    "• Anti-nuclear Antibody (ANA)",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontFamily: 'Inder',
                                        color: Color(0xFF4b4a4c)),
                                  ),
                                ),
                              ),
                              WidgetSpan(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 7),
                                  child: Text(
                                    "• Complete Blood Count (CBC)",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontFamily: 'Inder',
                                        color: Color(0xFF4b4a4c)),
                                  ),
                                ),
                              ),
                              WidgetSpan(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 7),
                                  child: Text(
                                    "• Direct antiglobulin (direct coombs) test",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontFamily: 'Inder',
                                        color: Color(0xFF4b4a4c)),
                                  ),
                                ),
                              ),
                              WidgetSpan(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 7),
                                  child: Text(
                                    "• Urine test",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontFamily: 'Inder',
                                        color: Color(0xFF4b4a4c)),
                                  ),
                                ),
                              ),
                              WidgetSpan(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 7),
                                  child: Text(
                                    "• Solid phase enzyme-linked immunosorbent assay",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontFamily: 'Inder',
                                        color: Color(0xFF4b4a4c)),
                                  ),
                                ),
                              ),
                              WidgetSpan(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 7),
                                  child: Text(
                                    "• CH50, CH100, Total complement test",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontFamily: 'Inder',
                                        color: Color(0xFF4b4a4c)),
                                  ),
                                ),
                              ),
                              WidgetSpan(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 7),
                                  child: Text(
                                    "• Kidney biopsy",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontFamily: 'Inder',
                                        color: Color(0xFF4b4a4c)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        "The following tests are optional:",
                        style: TextStyle(
                          fontSize: 22,
                          fontFamily: 'Inder',
                          color: Color(0xFF3D1A57),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 16,
                          top: 12,
                          bottom: 10,
                        ),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 7),
                                  child: Text(
                                    "• PTT, LA-sensitive PTT or dilute Russell viper venom test",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontFamily: 'Inder',
                                        color: Color(0xFF4b4a4c)),
                                  ),
                                ),
                              ),
                              WidgetSpan(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 7),
                                  child: Text(
                                    "• Chest X-ray or Ultrasound or computed tomography (CT)",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontFamily: 'Inder',
                                        color: Color(0xFF4b4a4c)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      FormBuilderField<bool>(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        name: 'agree',
                        initialValue: false,
                        validator: (value) {
                          if (value != true) {
                            return 'Please confirm to start detection';
                          }
                          return null;
                        },
                        builder: (FormFieldState<bool?> field) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                  bottom: 6,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Checkbox(
                                      value: field.value ?? false,
                                      onChanged: (value) {
                                        field.didChange(value);
                                      },
                                      materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                    ),
                                    Expanded(
                                      child: Text(
                                        'I have read and understood the prerequisites.',
                                        style: TextStyle(
                                          fontFamily: 'Inder',
                                          fontSize: 16,
                                          color: Color(0xFF3D1A57),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (field.hasError)
                                Container(
                                  margin: EdgeInsets.only(
                                    right: 10,
                                    left: 10,
                                    bottom: 10,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.error_outline,
                                        color: Color(0xffD6101D),
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width:
                                        MediaQuery.of(context).size.width *
                                            0.01,
                                      ),
                                      Text(
                                        "Please confirm to start detection",
                                        style: TextStyle(
                                          color: Color(0xffD6101D),
                                          fontFamily: "Inder",
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                            ],
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 28,vertical: 5,),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0xffD6101D),width: 2,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Close",
                                  style: TextStyle(
                                    color: Color(0xffD6101D),
                                    fontFamily: "Inder",
                                    fontSize: 19,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.27,
                              child: ElevatedButton(
                                onPressed: () {
                                  startDetection();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF502371),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                child: Text(
                                  "Start",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Inder",
                                    fontSize: 19,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.03),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
