import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:project_dd/common/bloc/characters/characters_bloc.dart';
import 'package:project_dd/common/bloc/characters/characters_event.dart';
import 'package:project_dd/common/bloc/characters/characters_state.dart';
import 'package:project_dd/core/app_colors.dart';
import 'package:project_dd/model/character.dart';

import '../characterCreationPage/character_creation_page.dart';

class CharactersListContainer extends StatelessWidget {
  const CharactersListContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CharactersBloc(),
      child: CharactersListPage(),
    );
  }
}

class CharactersListPage extends StatefulWidget {
  const CharactersListPage({Key key}) : super(key: key);

  @override
  State<CharactersListPage> createState() => _CharactersListPageState();
}

class _CharactersListPageState extends State<CharactersListPage> {
  bool isLoading = false;
  List<Character> characters = <Character>[];
  @override
  void initState() {
    context.read<CharactersBloc>().add(CharacterListFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<CharactersBloc, CharactersState>(
        listener: (context, state) {
          if (state is CharactersListFetchingState) {
            setState(() {
              isLoading = true;
            });
          }
          if (state is CharactersListFetchedState) {
            setState(() {
              characters = state.characters;
              isLoading = false;
            });
          }
          if (state is CharactersErrorState) {
            print(state.exception.toString());
            showDialog(
              context: context,
              builder: (ctx) {
                return AlertDialog(
                  title: Text('Ocorreu um Erro!'),
                  content: Text(state.exception.toString()),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
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
              : RefreshIndicator(
                  onRefresh: () async => reload(),
                  child: Container(
                    child: Stack(
                      children: [
                        ListView(
                          children: [
                            ...characters
                                .map(
                                  (e) => InkWell(
                                    onTap: () {},
                                    child: Card(
                                      child: Container(
                                        height: 100,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text('Character ID: ${e.id}'),
                                            Text('Name: ${e.name}'),
                                            Text('Level: ${e.level}'),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                                .toList()
                          ],
                        ),
                        Positioned(
                          bottom: 10,
                          right: 10,
                          child: Stack(
                            children: [
                              Positioned(
                                top: -2,
                                right: -2,
                                child: Stack(
                                  children: [
                                    Icon(
                                      Icons.circle,
                                      color: AppColors.purplePrimary,
                                      size: 20,
                                    ),
                                    Icon(
                                      Icons.add_circle,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                tooltip: 'Add character',
                                padding: EdgeInsets.zero,
                                iconSize: 48,
                                onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CharacterCreationContainer(
                                      recarregarPagina: reload,
                                    ),
                                  ),
                                ),
                                icon: LineIcon(
                                  LineIcons.diceD20,
                                  size: 48,
                                  color: AppColors.purplePrimary,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }

  reload() {
    context.read<CharactersBloc>().add(CharacterListFetchEvent());
  }
}
