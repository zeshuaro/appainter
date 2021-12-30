import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/basic_theme/basic_theme.dart';
import 'package:flutter_theme/common/common.dart';
import 'package:flutter_theme/home/home.dart';
import 'package:flutter_theme/services/services.dart';
import 'package:flutter_theme/theme_preview/theme_preview.dart';
import 'package:flutter_theme/widgets/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const _sdkVersion = '2.8.1';

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
          _ActionButtons(),
          const HorizontalPadding(),
        ],
      ),
      body: BlocListener<HomeCubit, HomeState>(
        listener: _listener,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: _ScaffoldBody(),
        ),
      ),
    );
  }

  void _listener(BuildContext context, HomeState state) {
    if (!state.isSdkShowed) {
      ScaffoldMessenger.of(context).showSnackBar(_buildSdkSnackBar());
      context.read<HomeCubit>().sdkShowed();
    }
  }

  SnackBar _buildSdkSnackBar() {
    return SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.white,
      duration: const Duration(seconds: 7),
      margin: EdgeInsets.only(
        left: kMargin,
        bottom: kMargin,
        right: MediaQuery.of(context).size.width * 0.7,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Supported Flutter SDK',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          const VerticalPadding(),
          Text(
            'Flutter Theme currently supports Flutter SDK: $_sdkVersion',
            style: Theme.of(context).textTheme.bodyText1,
          )
        ],
      ),
    );
  }
}

class _ActionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        ImportButton(key: Key('homePage_importButton')),
        HorizontalPadding(size: PaddingSize.medium),
        ExportButton(key: Key('homePage_exportButton')),
        HorizontalPadding(size: PaddingSize.medium),
        UsageButton(
          key: Key('homePage_usageButton'),
        ),
        HorizontalPadding(size: PaddingSize.medium),
        GithubButton(
          key: Key('homePage_githubButton'),
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
        const HorizontalPadding(),
        Expanded(
          child: Card(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: const ThemePreview(),
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
                child: const _Editors(),
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
      children: const [
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
        const Spacer(),
        const _RandomAndResetButtons(),
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
            style: const TextStyle(color: Colors.black),
          ),
        );
      }).toList(),
      onTap: (index) {
        context.read<HomeCubit>().editModeChanged(EditMode.values[index]);
      },
    );
  }
}

class _RandomAndResetButtons extends StatelessWidget {
  const _RandomAndResetButtons({Key? key}) : super(key: key);

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
              icon: const FaIcon(
                FontAwesomeIcons.random,
                size: 20,
              ),
            ),
            const HorizontalPadding(),
            IconButton(
              key: const Key('homePage_resetThemeButton'),
              onPressed: () {
                if (state.editMode == EditMode.basic) {
                  context.read<BasicThemeCubit>().defaultThemeRequested();
                } else {
                  context.read<AdvancedThemeCubit>().defaultThemeRequested();
                }
              },
              icon: const FaIcon(
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
