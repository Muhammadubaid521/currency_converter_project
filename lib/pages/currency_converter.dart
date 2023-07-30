import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrencyConverter extends StatefulWidget {
  const CurrencyConverter({super.key});

  @override
  State<CurrencyConverter> createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  String? valueChoose;
  String? valueChoose1;

  List<String> dropdownCountryList = ['indian rupees', 'pakistani rupees'];

  List<String> dropdownCountList = ['usd', 'pound'];
  @override
  Widget build(BuildContext context) {
    final amountController = TextEditingController();
    final totalController = TextEditingController();
    double? cal;
    double? result;

    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 20.w),
          child: Column(
            children: [
              const Text(
                'currency converter',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              TextField(
                controller: amountController,
                decoration: InputDecoration(
                    labelText: 'Amount',
                    labelStyle: const TextStyle(
                      fontSize: 15,
                      color: Colors.amber,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              DropdownButton(
                value: valueChoose,
                items: dropdownCountryList
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
                onChanged: (value) => setState(() {
                  valueChoose = value;
                }),
                hint: const Text('select country'),
              ),
              DropdownButton(
                value: valueChoose1,
                items: dropdownCountList
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
                onChanged: (value) => setState(() {
                  valueChoose1 = value;
                }),
                hint: const Text('select country'),
              ),
              TextField(
                controller: totalController,
                decoration: InputDecoration(
                    labelText: 'total',
                    labelStyle: const TextStyle(
                      fontSize: 15,
                      color: Colors.amber,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 15.h,
              ),
              GestureDetector(
                onTap: () {
                  // if (valueChoose == 'srilanka rupees' && valueChoose1 == 'usd') ;
                  // {
                  //   cal = int.parse(amountController.text) * 300;
                  //   result = cal;
                  //   totalController.text = result.toString();
                  // }

                  if (valueChoose == 'indian rupees' && valueChoose1 == 'usd') {
                    cal = int.parse(amountController.text) * 0.012;
                    result = cal;
                    totalController.text = result.toString();
                  }
                  if (valueChoose == 'pakistani rupees' &&
                      valueChoose1 == 'usd') {
                    cal = double.parse(amountController.text) * 0.0035;
                    result = cal;
                    totalController.text = result.toString();
                  }
                  // if (valueChoose == 'pakistani rupees' &&
                  //     valueChoose1 == 'England rupees') {
                  //   cal = double.parse(amountController.text) * 366.51;
                  //   result = cal;
                  //   totalController.text = result.toString();
                  // }
                },
                child: Container(
                  alignment: Alignment.center,
                  height: size.height / 14,
                  width: size.width,
                  child: const Text('Convert'),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
