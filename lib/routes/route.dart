import 'package:field_fox/models/daftar_lapangan.dart';
import 'package:field_fox/ui/screens/badminton_screen.dart';
import 'package:field_fox/ui/screens/bantuan_screen.dart';
import 'package:field_fox/ui/screens/basket_screen.dart';
import 'package:field_fox/ui/screens/chat_screen.dart';
import 'package:field_fox/ui/screens/detail_screen.dart';
import 'package:field_fox/ui/screens/favorit_screen.dart';
import 'package:field_fox/ui/screens/futsal_screen.dart';
import 'package:field_fox/ui/screens/gym_screen.dart';
import 'package:field_fox/ui/screens/history_screen.dart';
import 'package:field_fox/ui/screens/home_screen.dart';
import 'package:field_fox/ui/screens/komunitas_screen.dart';
import 'package:field_fox/ui/screens/main_screen.dart';
import 'package:field_fox/ui/screens/menu_lapangan_screen.dart';
import 'package:field_fox/ui/screens/notifikasi_screen.dart';
import 'package:field_fox/ui/screens/profile_screen.dart';
import 'package:field_fox/ui/screens/renang_screen.dart';
import 'package:field_fox/ui/screens/search_screen.dart';
import 'package:field_fox/ui/screens/sepakbola_screen.dart';
import 'package:field_fox/ui/screens/signin_screen.dart';
import 'package:field_fox/ui/screens/splash_screen.dart';
import 'package:field_fox/ui/screens/voli_screen.dart';
import 'package:go_router/go_router.dart';

part 'route_name.dart';

final route = GoRouter(routes: [
  GoRoute(
      path: '/',
      name: RouteName.splash,
      builder: (context, state) => SplashScreen(),
      routes: [
        GoRoute(
          path: 'signin',
          name: RouteName.signin,
          builder: (context, state) => SignInScreen(),
        ),
        GoRoute(
          path: 'main',
          name: RouteName.main,
          builder: (context, state) => MainScreen(),
        ),
        GoRoute(
          path: 'home',
          name: RouteName.home,
          builder: (context, state) => HomeScreen(),
        ),
        GoRoute(
          path: 'badminton',
          name: RouteName.badminton,
          builder: (context, state) => BadmintonScreen(),
        ),
        GoRoute(
          path: 'bantuan',
          name: RouteName.bantuan,
          builder: (context, state) => BantuanScreen(),
        ),
        GoRoute(
          path: 'basket',
          name: RouteName.basket,
          builder: (context, state) => BasketScreen(),
        ),
        GoRoute(
          path: 'chat',
          name: RouteName.chat,
          builder: (context, state) => ChatScreen(),
        ),
        GoRoute(
          path: 'detail',
          name: RouteName.detail,
          builder: (context, state) {
            final lapangan = state.extra as Lapangan;
            return DetailScreen(lapangan: lapangan);
          },
        ),
        GoRoute(
          path: 'favorite',
          name: RouteName.favorite,
          builder: (context, state) => FavoriteScreen(),
        ),
        GoRoute(
          path: 'futsal',
          name: RouteName.futsal,
          builder: (context, state) => FutsalScreen(),
        ),
        GoRoute(
          path: 'gym',
          name: RouteName.gym,
          builder: (context, state) => GymScreen(),
        ),
        GoRoute(
          path: 'history',
          name: RouteName.history,
          builder: (context, state) => HistoryScreen(),
        ),
        GoRoute(
          path: 'komunitas',
          name: RouteName.komunitas,
          builder: (context, state) => KomunitasScreen(),
        ),
        GoRoute(
          path: 'menuLapangan',
          name: RouteName.menuLapangan,
          builder: (context, state) => MenuLapanganScreen(),
        ),
        GoRoute(
          path: 'notifikasi',
          name: RouteName.notifikasi,
          builder: (context, state) => NotifikasiScreen(),
        ),
        GoRoute(
          path: 'profile',
          name: RouteName.profile,
          builder: (context, state) => ProfileScreen(),
        ),
        GoRoute(
          path: 'renang',
          name: RouteName.renang,
          builder: (context, state) => RenangScreen(),
        ),
        GoRoute(
          path: 'search',
          name: RouteName.search,
          builder: (context, state) => SearchScreen(),
        ),
        GoRoute(
          path: 'sepakbola',
          name: RouteName.sepakbola,
          builder: (context, state) => SepakBolaScreen(),
        ),
        GoRoute(
          path: 'voli',
          name: RouteName.voli,
          builder: (context, state) => VoliScreen(),
        ),
      ]),
]);
