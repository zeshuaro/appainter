import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:appainter/advanced_theme/advanced_theme.dart';
import 'package:appainter/basic_theme/basic_theme.dart';
import 'package:appainter/common/common.dart';
import 'package:appainter/home/home.dart';
import 'package:appainter/services/services.dart';
import 'package:appainter/theme_preview/theme_preview.dart';
import 'package:appainter/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const _sdkVersion = '2.8.1';
  static final _backgroundColorDark = Colors.grey[850]!;
  static final _backgroundColorLight = Colors.grey[200]!;

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().themeUsageFetched();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? _backgroundColorDark
          : _backgroundColorLight,
      appBar: AppBar(
        title: const Text('Appainter'),
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
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? _backgroundColorDark
          : _backgroundColorLight,
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
            'Appainter currently supports Flutter SDK: $_sdkVersion',
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
        const _EditModeActions(),
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
          key: Key('homePage_editModeTabBar_$text'),
          child: Text(
            text,
            style: Theme.of(context).textTheme.subtitle2,
          ),
        );
      }).toList(),
      onTap: (index) {
        context.read<HomeCubit>().editModeChanged(EditMode.values[index]);
      },
    );
  }
}

class _EditModeActions extends StatelessWidget {
  const _EditModeActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Row(
          children: const [
            ThemeBrightnessSwitch(),
            HorizontalPadding(),
            RandomThemeButton(),
            HorizontalPadding(),
            ResetThemeButton(),
          ],
        );
      },
    );
  }
}
