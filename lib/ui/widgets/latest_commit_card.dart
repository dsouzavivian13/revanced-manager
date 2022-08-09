import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:revanced_manager/services/github_api.dart';
import 'package:revanced_manager/constants.dart';
import 'package:revanced_manager/ui/widgets/patch_text_button.dart';

class LatestCommitCard extends StatefulWidget {
  const LatestCommitCard({Key? key}) : super(key: key);

  @override
  State<LatestCommitCard> createState() => _LatestCommitCardState();
}

class _LatestCommitCardState extends State<LatestCommitCard> {
  GithubAPI githubAPI = GithubAPI();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xff1B222B),
      ),
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  I18nText(
                    'latestCommitCard.patcherLabel',
                    child: Text(
                      '',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  FutureBuilder<String>(
                    future: githubAPI.latestCommitTime(
                      'revanced',
                      'revanced-patcher',
                    ),
                    initialData: FlutterI18n.translate(
                      context,
                      'latestCommitCard.loadingLabel',
                    ),
                    builder: (context, snapshot) => Text(
                      snapshot.data!,
                      style: robotoTextStyle,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  I18nText(
                    'latestCommitCard.managerLabel',
                    child: Text(
                      '',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  FutureBuilder<String>(
                    future: githubAPI.latestCommitTime(
                      'revanced',
                      'revanced-patcher',
                    ),
                    initialData: FlutterI18n.translate(
                      context,
                      'latestCommitCard.loadingLabel',
                    ),
                    builder: (context, snapshot) => Text(
                      snapshot.data!,
                      style: robotoTextStyle,
                    ),
                  ),
                ],
              ),
            ],
          ),
          PatchTextButton(
            text: FlutterI18n.translate(
              context,
              'latestCommitCard.updateButton',
            ),
            onPressed: () => {},
            backgroundColor: const Color(0xff7792BA),
          ),
        ],
      ),
    );
  }
}
