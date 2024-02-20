import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';

Future<String?> customAlert(
  BuildContext context, {
  Widget? content,
  Widget? title,
  Icon? icon,
  List<Widget>? actions,
  Function(BuildContext)? onClose,
  Function(BuildContext)? onTapOk,
}) async {
  var result = await showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      icon: icon ??
          const LineIcon.check(
            size: 18,
            color: Colors.green,
          ),
      title: title ??
          const Text(
            'Sucesso!',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
      content: content ??
          const Text(
            'Você criou um novo Cliente!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
      actions: actions ??
          <Widget>[
            Center(
              child: TextButton(
                style: const ButtonStyle(
                  alignment: Alignment.center,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Fechar'),
              ),
            ),
          ],
    ),
  );
  return result;
}
