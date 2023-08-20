import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String name;
  final VoidCallback onPressed;
  const Button({super.key, required this.name,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return 
                  GestureDetector(
                    onTap: onPressed,
                    child: Container(
                       margin: const EdgeInsets.all(10),
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(15),  
                        color: Theme.of(context).colorScheme.error
                      ),
                      child: Center(
                       child: Text(name,style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: const Color(0xffF5F5F5),),), 
                      ),
                      ),
                  );;
  }
}