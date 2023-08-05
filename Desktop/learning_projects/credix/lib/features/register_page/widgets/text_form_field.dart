import 'package:credix/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class NameTextField extends StatelessWidget {
  final TextEditingController controller;

  const NameTextField({super.key, required this.controller});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please Enter Your Full Name';
        }
        return null;
      },
      decoration: InputDecoration(
          isDense: true,
          labelText: 'Full Name',
          filled: false,
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
    );
  }
}

class PanTextField extends StatelessWidget {
  final TextEditingController controller;

  const PanTextField({super.key, required this.controller});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLength: 10,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please Enter Your Pan Card No';
        }
        if (value.length != 10) {
          return 'Please Enter a Valid Pan Card No';
        }
        return null;
      },
      decoration: InputDecoration(
          counterText: '',
          isDense: true,
          labelText: 'PAN Card',
          filled: false,
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
    );
  }
}

class AddressTextField extends StatelessWidget {
  final TextEditingController controller;

  const AddressTextField({super.key, required this.controller});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please Enter Your Address';
        }
        return null;
      },
      decoration: InputDecoration(
          isDense: true,
          labelText: 'Address',
          filled: false,
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
    );
  }
}

class GenderTextField extends StatelessWidget {
  final TextEditingController controller;
  final List<String> items;
  const GenderTextField(
      {super.key, required this.controller, required this.items});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      controller: controller,
      validator: (v) {
        if (v == null || v.isEmpty) {
          return 'Enter your Gender';
        }
        return null;
      },
      decoration: InputDecoration(
        isDense: true,
        focusedBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        hintText: 'Gender',
        suffixIcon: PopupMenuButton<String>(
          icon: const Icon(
            Icons.keyboard_arrow_down_sharp,
            size: 16,
          ),
          onSelected: (value) {
            controller.text = value;
          },
          itemBuilder: (BuildContext context) {
            return items.map<PopupMenuItem<String>>((String value) {
              return PopupMenuItem(value: value, child: Text(value));
            }).toList();
          },
        ),
      ),
    );
  }
}

class DobTextField extends StatelessWidget {
  final TextEditingController controller;

  DobTextField({super.key, required this.controller});
  String dob = '';
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        DateTime? picked = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1930),
            lastDate: DateTime.now());
        if (picked != null) {
          dob = DateFormat("yyyy-MM-dd").format(picked).toString();
          controller.text = dob;
        }
      },
      child: IgnorePointer(
        child: Theme(
          data: Theme.of(context)
              .copyWith(primaryColor: Theme.of(context).colorScheme.secondary),
          child: TextFormField(
            readOnly: true,
            controller: controller,
            validator: (v) {
              if (v == null || v.isEmpty) {
                return 'Enter your DOB';
              }
              return null;
            },
            decoration: InputDecoration(
                isDense: true,
                focusedBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                hintText: 'Date Of Birth',
                suffixIcon: const Icon(
                  Icons.keyboard_arrow_down_sharp,
                  size: 16,
                )),
          ),
        ),
      ),
    );
  }
}

class MobileTextFormField extends StatelessWidget {
  final TextEditingController controller;

  const MobileTextFormField({super.key, required this.controller});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      maxLength: 10,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r"[0-9]"))],
      validator: (v) {
        if (v?.length != 10) {
          return 'Please Enter Mobile Number';
        }
        return null;
      },
      decoration: InputDecoration(
          counterText: '',
          isDense: true,
          prefixIcon: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              kSizedBoxWidth(8.0),
              const Icon(Icons.phone_android_rounded, size: 24.0),
              kSizedBoxWidth(2.0),
              Text(
                '+91',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: kGreyColor),
              ),
              kSizedBoxWidth(8.0),
            ],
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: kBlueColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: kBlueColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: kBlueColor),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: kBlueColor),
          )),
    );
  }
}
