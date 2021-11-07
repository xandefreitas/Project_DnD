import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';
import 'package:project_dd/common/bloc/characters/characters_bloc.dart';
import 'package:project_dd/common/bloc/characters/characters_event.dart';
import 'package:project_dd/common/bloc/characters/characters_state.dart';
import 'package:project_dd/core/app_colors.dart';
import 'package:project_dd/model/auth.dart';
import 'package:project_dd/model/character.dart';
import 'package:project_dd/src/pages/characterCreationPage/components/app_bar_widget.dart';

import 'components/character_creation_args.dart';
import 'components/stats_row_widget.dart';
import 'components/text_box_widget.dart';

class CharacterCreationContainer extends StatelessWidget {
  const CharacterCreationContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as CharacterCreationArgs;
    return BlocProvider(
      create: (_) => CharactersBloc(),
      child: CharacterCreationPage(
        recarregarLista: args.function,
        auth: args.auth,
      ),
    );
  }
}

class CharacterCreationPage extends StatefulWidget {
  final Function recarregarLista;
  final Auth auth;
  CharacterCreationPage({
    Key key,
    this.recarregarLista,
    this.auth,
  }) : super(key: key);

  @override
  State<CharacterCreationPage> createState() => _CharacterCreationPageState();
}

class _CharacterCreationPageState extends State<CharacterCreationPage> {
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  Atributes characterAtributes = new Atributes();
  bool maleSelected = true;
  bool femaleSelected = false;
  bool genderlessSelected = false;

  Character _character = new Character(level: 1, experience: 0, equipment: [''], sex: 0);

  @override
  void initState() {
    _character.atributes = characterAtributes;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBarWidget(context, _character),
        body: BlocConsumer<CharactersBloc, CharactersState>(
          listener: (context, state) {
            if (state is CreatingCharacterState) {
              setState(() {
                isLoading = true;
              });
            }
            if (state is CreatedCharacterState) {
              setState(() {
                isLoading = false;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Character added!'),
                ),
              );
              widget.recarregarLista?.call();
              Navigator.pop(context);
            }
            if (state is CharactersErrorState) {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (ctx) {
                  return AlertDialog(
                    title: Text('Error!'),
                    content: Text('There was an error while trying to add a character'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Ok'),
                      ),
                    ],
                  );
                },
              );
            }
          },
          builder: (context, state) {
            return isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    child: Stack(
                      children: [
                        SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 6,
                                        child: Container(
                                          height: 50,
                                          child: TextFormField(
                                            style: TextStyle(color: AppColors.purplePrimary),
                                            cursorColor: AppColors.purplePrimary,
                                            decoration: InputDecoration(
                                              focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(color: AppColors.purplePrimary),
                                              ),
                                              enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(color: AppColors.purplePrimary),
                                              ),
                                              labelText: 'classes',
                                              labelStyle: TextStyle(color: AppColors.purplePrimary),
                                            ),
                                            onSaved: (value) => _character.characterClass = value,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 4,
                                        child: Container(),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Expanded(
                                        flex: 4,
                                        child: Padding(
                                          padding: const EdgeInsets.only(bottom: 2),
                                          child: Column(
                                            children: [
                                              Container(
                                                height: 50,
                                                child: TextFormField(
                                                  decoration: InputDecoration(
                                                    focusedBorder: UnderlineInputBorder(
                                                      borderSide: BorderSide(color: AppColors.purplePrimary),
                                                    ),
                                                    enabledBorder: UnderlineInputBorder(
                                                      borderSide: BorderSide(color: AppColors.purplePrimary),
                                                    ),
                                                    labelText: 'race',
                                                    labelStyle: TextStyle(color: AppColors.purplePrimary),
                                                  ),
                                                  onSaved: (value) => _character.race = value,
                                                ),
                                              ),
                                              SizedBox(height: 8),
                                              Container(
                                                height: 50,
                                                child: TextFormField(
                                                  decoration: InputDecoration(
                                                    focusedBorder: UnderlineInputBorder(
                                                      borderSide: BorderSide(color: AppColors.purplePrimary),
                                                    ),
                                                    enabledBorder: UnderlineInputBorder(
                                                      borderSide: BorderSide(color: AppColors.purplePrimary),
                                                    ),
                                                    labelText: 'alignment',
                                                    labelStyle: TextStyle(color: AppColors.purplePrimary),
                                                  ),
                                                  onSaved: (value) => _character.alignment = value,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Expanded(
                                        flex: 6,
                                        child: Padding(
                                          padding: const EdgeInsets.only(top: 4.0),
                                          child: Padding(
                                            padding: const EdgeInsets.only(top: 8.0),
                                            child: Row(
                                              children: [
                                                Flexible(
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(top: 8),
                                                    child: Container(
                                                      padding: EdgeInsets.all(8),
                                                      decoration: BoxDecoration(
                                                        border: Border.all(color: AppColors.purplePrimary),
                                                        borderRadius: BorderRadius.circular(6),
                                                      ),
                                                      child: TextFormField(
                                                        decoration: InputDecoration(
                                                          focusedBorder: UnderlineInputBorder(
                                                            borderSide: BorderSide(color: AppColors.purplePrimary),
                                                          ),
                                                          enabledBorder: UnderlineInputBorder(
                                                            borderSide: BorderSide(color: AppColors.purplePrimary),
                                                          ),
                                                          labelStyle: TextStyle(color: AppColors.purplePrimary),
                                                          alignLabelWithHint: true,
                                                          labelText: 'text',
                                                          border: OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                              color: AppColors.purplePrimary,
                                                            ),
                                                            borderRadius: BorderRadius.circular(6),
                                                          ),
                                                        ),
                                                        maxLines: 3,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Row(
                                      children: [
                                        Flexible(
                                          child: Padding(
                                            padding: const EdgeInsets.only(top: 8),
                                            child: Container(
                                              padding: EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                border: Border.all(color: AppColors.purplePrimary),
                                                borderRadius: BorderRadius.circular(6),
                                              ),
                                              child: TextFormField(
                                                decoration: InputDecoration(
                                                  focusedBorder: UnderlineInputBorder(
                                                    borderSide: BorderSide(color: AppColors.purplePrimary),
                                                  ),
                                                  enabledBorder: UnderlineInputBorder(
                                                    borderSide: BorderSide(color: AppColors.purplePrimary),
                                                  ),
                                                  labelStyle: TextStyle(color: AppColors.purplePrimary),
                                                  alignLabelWithHint: true,
                                                  labelText: 'skills',
                                                  border: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: AppColors.purplePrimary,
                                                    ),
                                                    borderRadius: BorderRadius.circular(6),
                                                  ),
                                                ),
                                                onSaved: (value) => _character.skills = <String>[value],
                                                maxLines: 3,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Flexible(
                                        child: Padding(
                                          padding: const EdgeInsets.only(top: 8),
                                          child: Container(
                                            padding: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              border: Border.all(color: AppColors.purplePrimary),
                                              borderRadius: BorderRadius.circular(6),
                                            ),
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                focusedBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(color: AppColors.purplePrimary),
                                                ),
                                                enabledBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(color: AppColors.purplePrimary),
                                                ),
                                                labelStyle: TextStyle(color: AppColors.purplePrimary),
                                                alignLabelWithHint: true,
                                                labelText: 'personality traits',
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: AppColors.purplePrimary,
                                                  ),
                                                  borderRadius: BorderRadius.circular(6),
                                                ),
                                              ),
                                              onSaved: (value) => _character.personalityTraits = <String>[value],
                                              maxLines: 4,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Flexible(
                                        child: Padding(
                                          padding: const EdgeInsets.only(top: 8),
                                          child: Container(
                                            padding: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              border: Border.all(color: AppColors.purplePrimary),
                                              borderRadius: BorderRadius.circular(6),
                                            ),
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                focusedBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(color: AppColors.purplePrimary),
                                                ),
                                                enabledBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(color: AppColors.purplePrimary),
                                                ),
                                                labelStyle: TextStyle(color: AppColors.purplePrimary),
                                                alignLabelWithHint: true,
                                                labelText: 'ideals',
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: AppColors.purplePrimary,
                                                  ),
                                                  borderRadius: BorderRadius.circular(6),
                                                ),
                                              ),
                                              onSaved: (value) => _character.ideals = <String>[value],
                                              maxLines: 4,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Padding(
                                          padding: const EdgeInsets.only(top: 8),
                                          child: Container(
                                            padding: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              border: Border.all(color: AppColors.purplePrimary),
                                              borderRadius: BorderRadius.circular(6),
                                            ),
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                focusedBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(color: AppColors.purplePrimary),
                                                ),
                                                enabledBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(color: AppColors.purplePrimary),
                                                ),
                                                labelStyle: TextStyle(color: AppColors.purplePrimary),
                                                alignLabelWithHint: true,
                                                labelText: 'bonds',
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: AppColors.purplePrimary,
                                                  ),
                                                  borderRadius: BorderRadius.circular(6),
                                                ),
                                              ),
                                              onSaved: (value) => _character.bonds = <String>[value],
                                              maxLines: 4,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Flexible(
                                        child: Padding(
                                          padding: const EdgeInsets.only(top: 8),
                                          child: Container(
                                            padding: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              border: Border.all(color: AppColors.purplePrimary),
                                              borderRadius: BorderRadius.circular(6),
                                            ),
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                focusedBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(color: AppColors.purplePrimary),
                                                ),
                                                enabledBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(color: AppColors.purplePrimary),
                                                ),
                                                labelStyle: TextStyle(color: AppColors.purplePrimary),
                                                alignLabelWithHint: true,
                                                labelText: 'flaws',
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: AppColors.purplePrimary,
                                                  ),
                                                  borderRadius: BorderRadius.circular(6),
                                                ),
                                              ),
                                              onSaved: (value) => _character.flaws = <String>[value],
                                              maxLines: 4,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 16),
                                    child: StatsRowWidget(characterAtributes: characterAtributes),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(primary: AppColors.purplePrimary),
                                        onPressed: _submitForm,
                                        child: Text('Done'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 24),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _character.sex = 0;
                                      maleSelected = true;
                                      femaleSelected = false;
                                      genderlessSelected = false;
                                    });
                                  },
                                  child: Tooltip(
                                    message: 'Male',
                                    child: Icon(
                                      LineIcons.mars,
                                      color: maleSelected ? Colors.blue[600] : Colors.black,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _character.sex = 1;
                                      maleSelected = false;
                                      femaleSelected = true;
                                      genderlessSelected = false;
                                    });
                                  },
                                  child: Tooltip(
                                    message: 'Female',
                                    child: Icon(
                                      LineIcons.venus,
                                      color: femaleSelected ? Colors.pink[600] : Colors.black,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _character.sex = 2;
                                      maleSelected = false;
                                      femaleSelected = false;
                                      genderlessSelected = true;
                                    });
                                  },
                                  child: Tooltip(
                                    message: 'Genderless',
                                    child: Icon(
                                      LineIcons.genderless,
                                      color: genderlessSelected ? Colors.green : Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }

  void _submitForm() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }
    _formKey.currentState?.save();
    _character.atributes = characterAtributes;
    context.read<CharactersBloc>().add(CharacterCreationEvent(character: _character, token: widget.auth));
  }
}
