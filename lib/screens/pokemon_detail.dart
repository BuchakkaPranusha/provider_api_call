import 'package:flutter/material.dart';
import 'package:pokeman/providers/provider.dart';
import 'package:pokeman/utils/capitalize.dart';
import 'package:provider/provider.dart';
//
// class PokemonDetailView extends StatefulWidget {
//   final String name;
//    PokemonDetailView({super.key, required this.name});
//
//   @override
//   State<PokemonDetailView> createState() => _PokemonDetailViewState();
// }
//
// class _PokemonDetailViewState extends State<PokemonDetailView> {
//
//   @override
//   void initState(){
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp){
//       Provider.of<PokeManProvider>(context, listen: false).getSelectedPokemonData(widget.name);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.name),
//       ),
//       body: Consumer<PokeManProvider>(
//         builder: (context,value,child) {
//           return Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 Container(
//                   height: 100,
//                   width: MediaQuery.of(context).size.width,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(16)
//                   ),
//                   child: Stack(
//                     children: [
//                       Image.network(
//                           "https://i.pinimg.com/550x/cb/33/49/cb3349b86ca661ca61ae9a36d88d70d4.jpg"),
//                       Text(widget.name)
//                     ],
//                   ),
//                 ),
//                 Text("Details: ", style: TextStyle(color: Colors.black,fontSize: 18),),
//                 Text("Height: ${value.pokemonDetails['height'].toString()}",style: TextStyle(color: Colors.grey,fontSize: 16),),
//                 Text("Weight: ${value.pokemonDetails['weight'].toString()}",style: TextStyle(color: Colors.grey,fontSize: 16),),
//
//               ],
//             ),
//           );
//         }),
//     );
//   }
// }
class PokemonDetailView extends StatelessWidget {
  final String pokemanName;
  const PokemonDetailView({super.key,required this.pokemanName});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(capitalize(pokemanName)),
      ),
      backgroundColor: Colors.white,
      body: Consumer<PokeManProvider>(
        builder: (context,value,child) {
          return !value.isLoading ?
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child: Stack(
                    children: [
                      Image.network(
                          height: 500,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.fill,
                          "https://i.pinimg.com/550x/cb/33/49/cb3349b86ca661ca61ae9a36d88d70d4.jpg"),
                      Align(alignment: Alignment.bottomCenter,
                          child: Text(capitalize(pokemanName)))
                    ],
                  ),
                ),
                const SizedBox(height: 16,),
                const Text("Details: ", style: TextStyle(color: Colors.black,fontSize: 18),),
                Text("Height: ${value.pokemonDetails['height'].toString()}",style: TextStyle(color: Colors.grey,fontSize: 16),),
                Text("Weight: ${value.pokemonDetails['weight'].toString()}",style: TextStyle(color: Colors.grey,fontSize: 16),),

              ],
            ),
          ) : const Center(child: CircularProgressIndicator(),);
        }),
    );
  }
}
