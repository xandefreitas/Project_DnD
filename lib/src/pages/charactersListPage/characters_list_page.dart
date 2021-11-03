import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:project_dd/common/bloc/authBloc/auth_bloc.dart';
import 'package:project_dd/common/bloc/authBloc/auth_event.dart';
import 'package:project_dd/common/bloc/characters/characters_bloc.dart';
import 'package:project_dd/common/bloc/characters/characters_event.dart';
import 'package:project_dd/common/bloc/characters/characters_state.dart';
import 'package:project_dd/core/app_colors.dart';
import 'package:project_dd/model/auth.dart';
import 'package:project_dd/model/character.dart';
import 'package:project_dd/src/pages/characterDetailsPage/character_details_page.dart';
import 'package:project_dd/util/app_routes.dart';

import '../characterCreationPage/character_creation_page.dart';

class CharactersListContainer extends StatelessWidget {
  const CharactersListContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as Auth;
    return BlocProvider(
      create: (_) => CharactersBloc(),
      child: CharactersListPage(
        auth: args,
      ),
    );
  }
}

class CharactersListPage extends StatefulWidget {
  final Auth auth;
  const CharactersListPage({Key key, this.auth}) : super(key: key);

  @override
  State<CharactersListPage> createState() => _CharactersListPageState();
}

class _CharactersListPageState extends State<CharactersListPage> {
  bool isLoading = false;
  List<Character> characters = <Character>[];
  @override
  void initState() {
    context.read<CharactersBloc>().add(CharactersListFetchEvent(widget.auth));
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
          if (state is DeletingCharacterState) {
            setState(() {
              isLoading = true;
            });
          }
          if (state is DeletedCharacterState) {
            reload();
          }
          if (state is CharactersErrorState) {
            print(state.exception.toString());
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (ctx) {
                return AlertDialog(
                  title: Text('There was an Error!'),
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
                                  (character) => InkWell(
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CharacterDetailsContainer(
                                          pageReload: reload,
                                          character: character,
                                          auth: widget.auth,
                                        ),
                                      ),
                                    ),
                                    child: Card(
                                      child: Container(
                                        height: 100,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('Character ID: ${character.id}'),
                                                Text('Name: ${character.name}'),
                                                Text('Level: ${character.level}'),
                                              ],
                                            ),
                                            InkWell(
                                              child: Icon(Icons.delete),
                                              onTap: () {
                                                showDialog(
                                                  context: context,
                                                  builder: (ctx) {
                                                    return AlertDialog(
                                                      title: Text('Character Delete'),
                                                      content: Text('Do you really want to delete this character?'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(context);
                                                          },
                                                          child: Text('No'),
                                                        ),
                                                        TextButton(
                                                          onPressed: () {
                                                            context
                                                                .read<CharactersBloc>()
                                                                .add(CharacterDeleteEvent(characterID: character.id, token: widget.auth));

                                                            Navigator.pop(context);
                                                          },
                                                          child: Text('Yes'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                                .toList()
                                .reversed
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
                                      pageReload: reload,
                                      auth: widget.auth,
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
    context.read<CharactersBloc>().add(CharactersListFetchEvent(widget.auth));
  }
}
