import 'package:airapy/theme/aircon_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:airapy/theme/theme.dart';
import 'package:airapy/utilities/margin.dart';
import 'package:airapy/view_models/track_data_vm.dart';
import 'package:airapy/views/success_screen.dart';
import 'package:airapy/widgets/appbar.dart';
import 'package:airapy/widgets/buttons.dart';
import 'package:airapy/widgets/textfield.dart';

class TrackFood extends StatefulWidget {
  @override
  _TrackFoodState createState() => _TrackFoodState();
}

class _TrackFoodState extends State<TrackFood> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TrackFoodViewModel>(context);
    return Scaffold(
      appBar: CustomSecAppBar(
        title: 'Track food',
        trailing: GestureDetector(
          child: Icon(Aircon.camera),
          onTap: () {
            provider.getImage();
          },
        ),
      ),
      backgroundColor: background,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: provider.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              provider.image != null ? AttachedPhoto() : Container(),
              YMargin(30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: Text(
                  'Meal',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ),
              YMargin(7),
              Wrap(
                children: [
                  ChoiceChip(
                    label: Text(
                      'Breakfast',
                      style: TextStyle(
                        color: (provider.meal == 'Breakfast')
                            ? white
                            : primaryBlue,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    selected: (provider.meal == 'Breakfast') ? true : false,
                    onSelected: (bool selected) {
                      provider.setMeal('Breakfast');
                    },
                    selectedColor: primaryBlue,
                    backgroundColor: (provider.meal == 'Breakfast')
                        ? primaryBlue
                        : secondaryBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                  ),
                  XMargin(12),
                  ChoiceChip(
                    label: Text(
                      'Lunch',
                      style: TextStyle(
                        color: (provider.meal == 'Lunch') ? white : primaryBlue,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    selected: (provider.meal == 'Lunch') ? true : false,
                    onSelected: (bool selected) {
                      provider.setMeal('Lunch');
                    },
                    selectedColor: primaryBlue,
                    backgroundColor: (provider.meal == 'Lunch')
                        ? primaryBlue
                        : secondaryBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                  ),
                  XMargin(12),
                  ChoiceChip(
                    label: Text(
                      'Dinner',
                      style: TextStyle(
                          color:
                              (provider.meal == 'Dinner') ? white : primaryBlue,
                          fontWeight: FontWeight.w600),
                    ),
                    selected: (provider.meal == 'Dinner') ? true : false,
                    onSelected: (bool selected) {
                      provider.setMeal('Dinner');
                    },
                    selectedColor: primaryBlue,
                    backgroundColor: (provider.meal == 'Dinner')
                        ? primaryBlue
                        : secondaryBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                  ),
                  XMargin(12),
                  ChoiceChip(
                    label: Text(
                      'Snack',
                      style: TextStyle(
                          color:
                              (provider.meal == 'Snack') ? white : primaryBlue,
                          fontWeight: FontWeight.w600),
                    ),
                    selected: (provider.meal == 'Snack') ? true : false,
                    onSelected: (bool selected) {
                      provider.setMeal('Snack');
                    },
                    selectedColor: primaryBlue,
                    backgroundColor: (provider.meal == 'Snack')
                        ? primaryBlue
                        : secondaryBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                  ),
                ],
              ),
              YMargin(30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: Text(
                  'Food',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ),
              YMargin(7),
              SustainTextField(
                validator: (value) {
                  if (value.isNotEmpty) {
                    return null;
                  } else {
                    return 'This field can\'t be left empty';
                  }
                },
                isTextArea: true,
                isPassword: false,
                autocorrect: false,
                isEmail: false,
                isPhone: false,
                isNumber: false,
                isEnabled: true,
                hintText: '',
                controller: provider.foodTEC,
              ),
              YMargin(30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: Text(
                  'Healthiness',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: 10),
              Wrap(
                children: [
                  ChoiceChip(
                    label: Text(
                      'Very healthy',
                      style: TextStyle(
                          color: (provider.healthiness == 'Very healthy')
                              ? white
                              : primaryBlue,
                          fontWeight: FontWeight.w600),
                    ),
                    selected:
                        (provider.healthiness == 'Very healthy') ? true : false,
                    onSelected: (bool selected) {
                      provider.setHealthiness('Very healthy');
                    },
                    selectedColor: primaryBlue,
                    backgroundColor: (provider.healthiness == 'Very healthy')
                        ? primaryBlue
                        : secondaryBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                  ),
                  XMargin(12),
                  ChoiceChip(
                    label: Text(
                      'A little healthy',
                      style: TextStyle(
                          color: (provider.healthiness == 'A little healthy')
                              ? white
                              : primaryBlue,
                          fontWeight: FontWeight.w600),
                    ),
                    selected: (provider.healthiness == 'A little healthy')
                        ? true
                        : false,
                    onSelected: (bool selected) {
                      provider.setHealthiness('A little healthy');
                    },
                    selectedColor: primaryBlue,
                    backgroundColor:
                        (provider.healthiness == 'A little healthy')
                            ? primaryBlue
                            : secondaryBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                  ),
                  XMargin(12),
                  ChoiceChip(
                    label: Text(
                      'Unhealthy',
                      style: TextStyle(
                          color: (provider.healthiness == 'Unhealthy')
                              ? white
                              : primaryBlue,
                          fontWeight: FontWeight.w600),
                    ),
                    selected:
                        (provider.healthiness == 'Unhealthy') ? true : false,
                    onSelected: (bool selected) {
                      provider.setHealthiness('Unhealthy');
                    },
                    selectedColor: primaryBlue,
                    backgroundColor: (provider.healthiness == 'Unhealthy')
                        ? primaryBlue
                        : secondaryBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                  ),
                ],
              ),
              YMargin(30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: Text(
                  'Portion size',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: 10),
              Wrap(
                children: [
                  ChoiceChip(
                    label: Text(
                      'Large',
                      style: TextStyle(
                          color: (provider.portionSize == 'Large')
                              ? white
                              : primaryBlue,
                          fontWeight: FontWeight.w600),
                    ),
                    selected: (provider.portionSize == 'Large') ? true : false,
                    onSelected: (bool selected) {
                      provider.setPortionsize('Large');
                    },
                    selectedColor: primaryBlue,
                    backgroundColor: (provider.portionSize == 'Large')
                        ? primaryBlue
                        : secondaryBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                  ),
                  XMargin(12),
                  ChoiceChip(
                    label: Text(
                      'Mid-sized',
                      style: TextStyle(
                          color: (provider.portionSize == 'Mid-sized')
                              ? white
                              : primaryBlue,
                          fontWeight: FontWeight.w600),
                    ),
                    selected:
                        (provider.portionSize == 'Mid-sized') ? true : false,
                    onSelected: (bool selected) {
                      provider.setPortionsize('Mid-sized');
                    },
                    selectedColor: primaryBlue,
                    backgroundColor: (provider.portionSize == 'Mid-sized')
                        ? primaryBlue
                        : secondaryBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                  ),
                  XMargin(12),
                  ChoiceChip(
                    label: Text(
                      'Small',
                      style: TextStyle(
                          color: (provider.portionSize == 'Small')
                              ? white
                              : primaryBlue,
                          fontWeight: FontWeight.w600),
                    ),
                    selected: (provider.portionSize == 'Small') ? true : false,
                    onSelected: (bool selected) {
                      provider.setPortionsize('Small');
                    },
                    selectedColor: primaryBlue,
                    backgroundColor: (provider.portionSize == 'Small')
                        ? primaryBlue
                        : secondaryBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                  ),
                ],
              ),
              YMargin(100),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        color: background,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: PrimaryButton(
            buttonText: 'Save',
            onPressed: () {
              if (provider.formKey.currentState.validate()) {
                provider.logFood(context);
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SuccessScreen(
                      image: 'images/star.png',
                      title: 'Nice job tracking!',
                      subtitle:
                          'Tracking your meals helps your coach give you the best possible advice. Keep those details coming.',
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

class AttachedPhoto extends StatelessWidget {
  const AttachedPhoto({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TrackFoodViewModel>(context);
    return Column(
      children: [
        YMargin(22),
        Stack(
          children: [
            Container(
              child: provider.image != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.file(
                        provider.image,
                        fit: BoxFit.fitWidth,
                      ),
                    )
                  : Container(),
              height: 230.0,
              width: double.infinity,
            ),
            Positioned(
              top: 8,
              right: 8,
              child: GestureDetector(
                onTap: () => provider.clearImage(),
                child: Container(
                  width: 28,
                  height: 28,
                  child: Icon(
                    Aircon.cancel,
                    size: 15,
                    color: primaryBlue,
                  ),
                  padding: EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    color: Color(0xFFDCE8F9).withOpacity(0.4),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class SChip extends StatelessWidget {
  final String labelText;
  SChip({this.labelText});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        labelText,
        style: TextStyle(color: grey),
      ),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          side: BorderSide(color: grey)),
    );
  }
}
