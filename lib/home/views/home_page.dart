import 'package:appainter/advanced_theme/advanced_theme.dart';
import 'package:appainter/basic_theme/basic_theme.dart';
import 'package:appainter/common/common.dart';
import 'package:appainter/home/home.dart';
import 'package:appainter/theme_preview/theme_preview.dart';
import 'package:appainter/widgets/widgets.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  static const _sdkVersion = '3.24.0+';
  static final _backgroundColorDark = Colors.grey[900]!;
  static final _backgroundColorLight = Colors.grey[200]!;

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().themeUsageFetched();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? _backgroundColorDark : _backgroundColorLight,
      appBar: _buildAppBar(isDark),
      body: BlocListener<HomeCubit, HomeState>(
        listener: _listener,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: _ScaffoldBody(),
        ),
      ),
    );
  }

  AppBar _buildAppBar(bool isDark) {
    final color = isDark ? Colors.white : Colors.grey;
    return AppBar(
      backgroundColor: isDark ? Colors.black : Colors.white,
      actionsIconTheme: IconThemeData(color: color),
      title: Row(
        children: [
          const Image(
            image: AssetImage('assets/icon.png'),
            height: 48,
          ),
          const HorizontalPadding(
            size: PaddingSize.medium,
          ),
          Text(
            'Appainter',
            style: TextStyle(color: color),
          ),
        ],
      ),
      centerTitle: false,
      actions: [
        ImportButton(
          key: const Key('homePage_importButton'),
          color: color,
        ),
        const HorizontalPadding(size: PaddingSize.medium),
        ExportButton(
          key: const Key('homePage_exportButton'),
          color: color,
        ),
        const HorizontalPadding(size: PaddingSize.medium),
        const AppThemeModeButton(),
        const HorizontalPadding(size: PaddingSize.medium),
        const UsageButton(key: Key('homePage_usageButton')),
        const HorizontalPadding(size: PaddingSize.medium),
        const GithubButton(key: Key('homePage_githubButton')),
        const HorizontalPadding(),
      ],
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
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const VerticalPadding(),
          Text(
            'Appainter currently supports Flutter SDK: $_sdkVersion',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
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
        ),
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
              final controller = DefaultTabController.of(context);
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
  const _Editors();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _EditModeHeader(),
        VerticalPadding(),
        _ThemeConfigs(),
        VerticalPadding(),
        Expanded(
          child: TabBarView(
            children: [
              BasicThemeEditor(),
              AdvancedEditor(),
            ],
          ),
        ),
      ],
    );
  }
}

class _EditModeHeader extends StatelessWidget {
  const _EditModeHeader();

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
        final text = EnumToString.convertToString(mode, camelCase: true);
        return Tab(
          key: Key('homePage_editModeTabBar_$text'),
          child: Text(
            text,
            style: Theme.of(context).textTheme.titleMedium,
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
  const _EditModeActions();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        RandomThemeButton(),
        HorizontalPadding(),
        ResetThemeButton(),
      ],
    );
  }
}

class _ThemeConfigs extends StatelessWidget {
  const _ThemeConfigs();

  @override
  Widget build(BuildContext context) {
    return MyCard(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Theme configurations',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const Row(
            children: [
              Material3Switch(),
              HorizontalPadding(),
              ThemeBrightnessSwitch(),
            ],
          ),
        ],
      ),
    );
  }
}
