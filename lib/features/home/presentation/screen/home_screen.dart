import 'package:flutter/material.dart';
import 'package:news_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return SafeArea(
            child: Scaffold(
                drawer: Drawer(
                  backgroundColor: Colors.white,
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      const DrawerHeader(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          color: Colors.white,
                          border: Border(
                              bottom:
                                  BorderSide(color: Colors.black, width: 1.0)),
                        ),
                        child: Center(
                          child: Text(
                            'News App',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ),
                      ListTile(
                        title: const Text('Home'),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        title: const Text('Settings'),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        title: const Text('About'),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        title: const Text('Logout'),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
                floatingActionButton: FloatingActionButton(
                  foregroundColor: Colors.black,
                  elevation: 8,
                  onPressed: () {
                    context.read<HomeBloc>().add(RefreshNewsEvent());
                  },
                  child: const Icon(Icons.refresh),
                ),
                appBar: AppBar(
                  elevation: 10,
                  centerTitle: true,
                  title: const Text(
                    "Top Headlines",
                    style: TextStyle(fontSize: 28, color: Colors.black),
                  ),
                ),
                body: BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state is HomeLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is HomeLoaded) {
                      return ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        padding: const EdgeInsets.all(16),
                        itemCount: state.news.length,
                        itemBuilder: (context, index) {
                          return Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            shadowColor: Colors.black,
                            color: Colors.white,
                            semanticContainer: true,
                            elevation: 8,
                            margin: const EdgeInsets.all(16),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.network(
                                    state.news[index].urlToImage,
                                    fit: BoxFit.cover,
                                    width: 200,
                                    height: 200,
                                    errorBuilder: (context, error, stackTrace) {
                                      return const Icon(
                                        Icons.image,
                                        size: 200,
                                      );
                                    },
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  ListTile(
                                    // display news title
                                    leading: const Icon(
                                      Icons.newspaper,
                                      color: Colors.black,
                                    ),

                                    title: Text(state.news[index].title,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),

                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // display news description
                                        Text(state.news[index].description,
                                            style: const TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey)),

                                        // display publishedAt
                                        Text(state.news[index].publishedAt,
                                            style: const TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                    return const Center(child: Text('No news available'));
                  },
                )));
      },
    );
  }
}
