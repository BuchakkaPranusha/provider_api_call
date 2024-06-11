import 'package:flutter/material.dart';
import 'package:pokeman/providers/provider.dart';
import 'package:pokeman/screens/pokemon_detail.dart';
import 'package:pokeman/utils/capitalize.dart';
import 'package:provider/provider.dart';

class PokeMansView extends StatefulWidget {
  const PokeMansView({super.key});

  @override
  State<PokeMansView> createState() => _PokeMansViewState();
}

class _PokeMansViewState extends State<PokeMansView> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp){
      Provider.of<PokeManProvider>(context, listen: false).getAllData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemon'),
        centerTitle: true,
      ),
      body: Consumer<PokeManProvider>(
        builder: (context,value,child){
          return !value.isLoading? ListView.builder(
            itemCount: value.results.length,
            itemBuilder: (context, index) {
              return InkWell(
                splashColor: Colors.transparent,
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => PokemonDetailView(pokemanName: value.results[index].name,)));
                  Provider.of<PokeManProvider>(context, listen: false).getSelectedPokemonData(value.results[index].name);
                },
                child: Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                      leading: const CircleAvatar(
                          radius: 22,
                          backgroundImage: NetworkImage(
                            // value.results[index].url
                              'https://i.pinimg.com/550x/cb/33/49/cb3349b86ca661ca61ae9a36d88d70d4.jpg'
                          ),
                          backgroundColor: Colors.white,
                        ),
                        trailing: const Icon(
                            Icons.pets,
                            color: Colors.red,
                          ),
                        title: Text(capitalize(value.results[index].name))),
                ),
              );
            }
          ): const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
  //
  // Widget getLoadingUI() {
  //   return const Center(
  //     child: Column(
  //       mainAxisSize: MainAxisSize.min,
  //       children:  [
  //        CircularProgressIndicator(),
  //         Text(
  //           'Loading...',
  //           style: TextStyle(fontSize: 20, color: Colors.blue),
  //         ),
  //       ],
  //     ),
  //   );
  // }
  //
  // Widget getErrorUI(String error) {
  //   return Center(
  //     child: Text(
  //       error,
  //       style: const TextStyle(color: Colors.red, fontSize: 22),
  //     ),
  //   );
  // }
  //
  // Widget getBodyUI() {
  //   final provider = Provider.of<PokeManProvider>(context, listen: false);
  //   return Column(
  //     children: [
  //       // Padding(
  //       //   padding: const EdgeInsets.all(8.0),
  //       //   child: TextField(
  //       //     onChanged: (value) {
  //       //       provider.search(value);
  //       //     },
  //       //     decoration: InputDecoration(
  //       //       hintText: 'Search',
  //       //       border: OutlineInputBorder(
  //       //         borderRadius: BorderRadius.circular(10),
  //       //       ),
  //       //       suffixIcon: const Icon(Icons.search),
  //       //     ),
  //       //   ),
  //       // ),
  //       Container(
  //         height: MediaQuery.of(context).size.height,
  //         child: Consumer(
  //           builder: (context, PokeManProvider pokemanProvider, child) =>
  //               ListView.builder(
  //                 itemCount: pokemanProvider.pokemanList.results.length,
  //                 itemBuilder: (context, index) => ListTile(
  //                   leading: const CircleAvatar(
  //                     radius: 22,
  //                     backgroundImage: NetworkImage(
  //                         // pokemanProvider.pokemanList.data[index].url
  //                       'https://i.pinimg.com/550x/cb/33/49/cb3349b86ca661ca61ae9a36d88d70d4.jpg'
  //                     ),
  //                     backgroundColor: Colors.white,
  //                   ),
  //                   title: Text(pokemanProvider.pokemanList.results[index].name),
  //                   trailing:
  //                       // ? const SizedBox()
  //                        const Icon(
  //                     Icons.pets,
  //                     color: Colors.red,
  //                   ),
  //                 ),
  //               ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

}
