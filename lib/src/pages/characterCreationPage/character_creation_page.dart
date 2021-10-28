import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';
import 'package:project_dd/common/bloc/characters/characters_bloc.dart';
import 'package:project_dd/common/bloc/characters/characters_event.dart';
import 'package:project_dd/common/bloc/characters/characters_state.dart';
import 'package:project_dd/model/character.dart';
import 'package:project_dd/src/pages/characterCreationPage/components/app_bar_widget.dart';

import 'components/stats_field_widget.dart';
import 'components/text_box_widget.dart';

class CharacterCreationContainer extends StatelessWidget {
  final Function pageReload;
  const CharacterCreationContainer({
    Key key,
    this.pageReload,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CharactersBloc(),
      child: CharacterCreationPage(recarregarLista: pageReload),
    );
  }
}

class CharacterCreationPage extends StatefulWidget {
  final Function recarregarLista;
  CharacterCreationPage({Key key, this.recarregarLista}) : super(key: key);

  @override
  State<CharacterCreationPage> createState() => _CharacterCreationPageState();
}

class _CharacterCreationPageState extends State<CharacterCreationPage> {
  bool isLoading = false;

  Character _character = Character(
    alignment: 'light',
    atributes: Atributes(
      strenght: 15,
      dexterity: 16,
      constitution: 17,
      intelligence: 17,
      wisdom: 16,
      charm: 15,
    ),
    bonds: [''],
    characterClass: 'druid',
    equipment: [''],
    experience: 99.9,
    flaws: [''],
    ideals: [''],
    level: 25,
    name: 'darkxande',
    personalityTraits: [''],
    race: 'human',
    sex: 1,
    skills: ['fireball', 'flame wall'],
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(context),
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
            widget.recarregarLista?.call();
            Navigator.pop(context);
          }
          if (state is CharactersErrorState) {
            showDialog(
              context: context,
              builder: (ctx) {
                return AlertDialog(
                  title: Text('Ocorreu um Erro!'),
                  content: Text('Ocorreu um erro ao salvar o personagem!'),
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Stack(
                      children: [
                        SingleChildScrollView(
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
                                          decoration: InputDecoration(labelText: 'classes'),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: Container(),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 50,
                                            child: TextFormField(
                                              decoration: InputDecoration(labelText: 'race'),
                                            ),
                                          ),
                                          SizedBox(height: 8),
                                          Container(
                                            height: 50,
                                            child: TextFormField(
                                              decoration: InputDecoration(labelText: 'alignment'),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Expanded(
                                      flex: 7,
                                      child: TextBoxWiget(
                                        label: 'skills',
                                        maxLines: 3,
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: TextBoxWiget(
                                    label: 'equipment',
                                    maxLines: 6,
                                  ),
                                ),
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        StatsFieldWidget(statName: 'STR'),
                                        StatsFieldWidget(statName: 'DEX'),
                                        StatsFieldWidget(statName: 'CON'),
                                        StatsFieldWidget(statName: 'INT'),
                                        StatsFieldWidget(statName: 'WIS'),
                                        StatsFieldWidget(statName: 'CHA'),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Flexible(
                                      child: TextBoxWiget(
                                        label: 'personality traits',
                                        maxLines: 4,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Flexible(
                                      child: TextBoxWiget(
                                        label: 'ideals',
                                        maxLines: 4,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: TextBoxWiget(
                                        label: 'bonds',
                                        maxLines: 4,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    Flexible(
                                      child: TextBoxWiget(
                                        label: 'flaws',
                                        maxLines: 4,
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        context.read<CharactersBloc>().add(CharacterCreationEvent(_character));
                                      },
                                      child: Text('Done'),
                                    ),
                                  ),
                                ),
                              ],
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
                                  onTap: () {},
                                  child: Tooltip(
                                    message: 'Male',
                                    child: Icon(LineIcons.mars),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Tooltip(
                                    message: 'Female',
                                    child: Icon(LineIcons.venus),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Tooltip(
                                    message: 'Genderless',
                                    child: Icon(LineIcons.genderless),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
