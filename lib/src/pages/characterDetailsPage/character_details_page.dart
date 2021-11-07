import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_dd/common/bloc/characters/characters_bloc.dart';
import 'package:project_dd/common/bloc/characters/characters_event.dart';
import 'package:project_dd/common/bloc/characters/characters_state.dart';
import 'package:project_dd/model/auth.dart';
import 'package:project_dd/model/character.dart';

import 'components/character_details_args.dart';

enum ViewMode {
  View,
  Edit,
}

class CharacterDetailsContainer extends StatelessWidget {
  const CharacterDetailsContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as CharacterDetailsArgs;
    return BlocProvider(
      create: (_) => CharactersBloc(),
      child: CharacterDetailsPage(
        reloadList: args.function,
        character: args.character,
        auth: args.auth,
      ),
    );
  }
}

class CharacterDetailsPage extends StatefulWidget {
  final Function reloadList;
  final Character character;
  final Auth auth;
  CharacterDetailsPage({
    Key key,
    this.reloadList,
    this.character,
    this.auth,
  }) : super(key: key);

  @override
  State<CharacterDetailsPage> createState() => _CharacterCreationPageState();
}

class _CharacterCreationPageState extends State<CharacterDetailsPage> {
  bool isLoading = false;
  ViewMode _viewMode = ViewMode.View;
  Character _updatedCharacter;

  @override
  void initState() {
    _updatedCharacter = widget.character;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.character.name),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Exp: ${widget.character.experience}',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'Level: ${widget.character.level}',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<CharactersBloc, CharactersState>(
        listener: (context, state) {
          if (state is UpdatingCharacterState) {
            setState(() {
              isLoading = true;
            });
          }
          if (state is UpdatedCharacterState) {
            setState(() {
              isLoading = false;
            });
            widget.reloadList?.call();
            Navigator.pop(context);
          }
          if (state is CharactersErrorState) {
            print(state.exception.toString());
            showDialog(
              barrierDismissible: false,
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
              : Container(
                  child: Center(
                    child: FloatingActionButton(
                      onPressed: () {
                        _updatedCharacter.experience += 30;
                        if (_updatedCharacter.experience >= 100) {
                          _updatedCharacter.experience -= 100;
                          _updatedCharacter.level++;
                        }
                        context.read<CharactersBloc>().add(CharacterUpdateEvent(character: _updatedCharacter, token: widget.auth));
                      },
                    ),
                  ),
                );
        },
      ),
    );
  }
}
