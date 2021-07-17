import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/basic_theme/basic_theme.dart';
import 'package:flutter_theme/common/common.dart';
import 'package:flutter_theme/home/home.dart';
import 'package:flutter_theme/home/widgets/import_btn.dart';
import 'package:flutter_theme/home/widgets/widgets.dart';
import 'package:flutter_theme/services/services.dart';
import 'package:flutter_theme/theme_preview/theme_preview.dart';
import 'package:flutter_theme/widgets/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  final ThemeService themeService;

  const HomePage({Key? key, ThemeService? themeService})
      : themeService = themeService ?? const ThemeService(),
        super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().themeUsageFetched();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Flutter Theme'),
        centerTitle: false,
        actions: [
          _ActionBtns(
            themeService: widget.themeService,
          ),
          HorizontalPadding(),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: _ScaffoldBody(),
      ),
    );
  }
}

class _ActionBtns extends StatelessWidget {
  final ThemeService themeService;

  const _ActionBtns({Key? key, required this.themeService}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ImportBtn(
          key: const Key('homePage_importBtn'),
          themeService: themeService,
        ),
        HorizontalPadding(),
        ExportBtn(
          key: const Key('homePage_exportBtn'),
          themeService: themeService,
        ),
        HorizontalPadding(),
        UsageBtn(
          key: const Key('homePage_usageBtn'),
        ),
      ],
    );
  }
}

class _ScaffoldBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPaddingAll,
      child: _EditorPreview(),
    );
  }
}

class _EditorPreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _EditorsContainer(),
        ),
        HorizontalPadding(),
        Expanded(
          child: Card(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: ThemePreview(),
            ),
          ),
        )
      ],
    );
  }
}

class _EditorsContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) => previous.editMode != current.editMode,
      builder: (context, state) {
        return DefaultTabController(
          initialIndex: EditMode.values.indexOf(state.editMode),
          length: EditMode.values.length,
          child: Builder(
            builder: (context) {
              final controller = DefaultTabController.of(context)!;
              controller.addListener(() {
                if (!controller.indexIsChanging &&
                    controller.index != controller.previousIndex) {
                  context
                      .read<HomeCubit>()
                      .editModeChanged(EditMode.values[controller.index]);
                }
              });

              return BlocListener<HomeCubit, HomeState>(
                listenWhen: (previous, current) {
                  return previous.editMode != current.editMode;
                },
                listener: (context, state) {
                  controller.animateTo(EditMode.values.indexOf(state.editMode));
                },
                child: _Editors(),
              );
            },
          ),
        );
      },
    );
  }
}

class _Editors extends StatelessWidget {
  const _Editors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _EditModeHeader(),
        VerticalPadding(),
        Expanded(
          child: TabBarView(
            children: [
              BasicEditor(),
              AdvancedEditor(),
            ],
          ),
        ),
      ],
    );
  }
}

class _EditModeHeader extends StatelessWidget {
  const _EditModeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _EditModeTabBar(),
        ),
        Spacer(),
        _RandomAndResetBtns(),
      ],
    );
  }
}

class _EditModeTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: EditMode.values.map((mode) {
        final text = UtilService.enumToString(mode);
        return Tab(
          child: Text(
            text,
            style: TextStyle(color: Colors.black),
          ),
        );
      }).toList(),
      onTap: (index) {
        context.read<HomeCubit>().editModeChanged(EditMode.values[index]);
      },
    );
  }
}

class _RandomAndResetBtns extends StatelessWidget {
  const _RandomAndResetBtns({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) => previous.editMode != current.editMode,
      builder: (context, state) {
        return Row(
          children: [
            IconButton(
              key: const Key('homePage_randomizeThemeButton'),
              onPressed: () {
                if (state.editMode == EditMode.basic) {
                  context.read<BasicThemeCubit>().randomizedThemeRequested();
                } else {
                  context.read<AdvancedThemeCubit>().randomizedThemeRequested();
                }
              },
              icon: FaIcon(
                FontAwesomeIcons.random,
                size: 20,
              ),
            ),
            HorizontalPadding(),
            IconButton(
              key: const Key('homePage_resetThemeButton'),
              onPressed: () {
                if (state.editMode == EditMode.basic) {
                  context.read<BasicThemeCubit>().defaultThemeRequested();
                } else {
                  context.read<AdvancedThemeCubit>().defaultThemeRequested();
                }
              },
              icon: FaIcon(
                FontAwesomeIcons.redo,
                size: 20,
              ),
            ),
          ],
        );
      },
    );
  }
}
