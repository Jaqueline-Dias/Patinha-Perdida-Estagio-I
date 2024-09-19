import 'package:app_patinha/src/core/theme/patinha_perdida_theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  var auth = FirebaseAuth.instance;
  var db = FirebaseFirestore.instance;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
// Feed de postagens
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Texto introdutório
            const Padding(
              padding: EdgeInsets.only(
                top: 16,
                left: 16,
                bottom: 8.0,
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Últimos relatos',
                  style: PatinhaPerdidaTheme.titleDescription,
                ),
              ),
            ),

            //Apresentação dos relatos
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Card(
                margin: const EdgeInsets.all(8.0),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Dados do usuário que relatou
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              //Foto de perfil
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "https://img.freepik.com/fotos-gratis/mulher-asiatica-sorridente-com-estudante-de-notebooks-com-promocao-de-cara-feliz-de-fundo-azul-de-educacao-universitaria_1258-167224.jpg?t=st=1713360156~exp=1713363756~hmac=811025b5d3c0b388acdfa27578464793c9dcbd44829faa001d22b22c61786d5c&w=740"),
                                radius: 16,
                              ),
                              //Nome
                              Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Nome do Usuário",
                                      style:
                                          PatinhaPerdidaTheme.titleDescription,
                                    ),
                                    Text(
                                      "há 6 horas",
                                      style:
                                          PatinhaPerdidaTheme.subtitleSmallDate,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 16,
                      ),

                      //Fotos do animal
                      Image.network(
                          'https://img.freepik.com/fotos-gratis/cao-feliz-sorridente-isolado-fundo-branco-retrato-2_1562-691.jpg?t=st=1713358928~exp=1713362528~hmac=bdaf693a7c598dead3dd0a57f43a01797d0c402e9417495a3fb2596dabbbf777&w=740'),

                      //Descrição do animal

                      const SizedBox(
                        height: 8,
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 8,
                      ),

                      const Text(
                        "Descrição do animal",
                        style: PatinhaPerdidaTheme.titleDescription,
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            child: Expanded(
                              child: Container(
                                color: Colors.purple,
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Text("Porte"),
                                      Text("Grande"),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          Container(
                            color: Colors.yellow,
                            child: const Column(
                              children: [
                                Text("Pelagem"),
                                Text("Curto liso"),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 8.0,
                      ),

                      const Text("Não possui coleira"),
                      const Text("Aparenta estar desnutrido"),
                      const Text("Não aparenta ser dócil"),
                      const Text("Aparenta estar machucado"),

                      const SizedBox(
                        height: 16,
                      ),

                      //Localização
                      const Text(
                        "Localização",
                        style: PatinhaPerdidaTheme.titleDescription,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            /* StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("relatos")
                  .orderBy("dataHora", descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(
                    child: Text(
                      "Erro ao recuperar os dados",
                      style: TextStyle(color: Colors.red),
                    ),
                  );
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                List<DocumentSnapshot> documentos = snapshot.data!.docs;

                return ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: documentos.length,
                  itemBuilder: (context, index) {
                    PostModel postagem =
                        PostModel.fromFirestore(documentos[index]);

                    return Card(
                      color: Colors.white,
                      margin: const EdgeInsets.all(8.0),
                      shadowColor: Colors.grey,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            //Exibir o nome do usuário que registrou
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(postagem.perfil!),
                                    radius: 16,
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.bottomLeft,
                                  child: FutureBuilder(
                                    future: _getUserName(postagem.usuario!),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return const Text("Carregando...");
                                      } else if (snapshot.hasError) {
                                        return const Text(
                                            "Erro ao carregar o nome do usuário");
                                      } else {
                                        return Text(
                                          "${snapshot.data}",
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                            //Exibe a data de postagem
                            Container(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 5.0),
                                child: Text(
                                  "Publicado em: ${utilsServices.formatDate(documentos[index]["dataHora"])}",
                                ),
                              ),
                            ),

                            const Padding(padding: EdgeInsets.only(bottom: 10)),

                            //Exibe a foto do animal se estiver presente
                            postagem.fotos != null
                                ? SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: _carrossel(postagem.fotos!),
                                    ),
                                  )
                                : Container(),

                            //Divisor
                            const Divider(
                              height: 20,
                              thickness: 1,
                              indent: 0,
                              endIndent: 0,
                              //color: CustomColors.customSwatchColor,
                            ),

                            //Botão do like e dislike

                            //Dados do animal
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: const EdgeInsets.all(5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //Descrição do animal
                                  const Row(
                                    children: [
                                      Icon(
                                        Icons.article_outlined,
                                      ),

                                      // Espaçamento entre o ícone e o texto
                                      SizedBox(width: 5),
                                      Text(
                                        "Descrição do animal:",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          //  color: CustomColors
                                          //     .customSwatchColorPurple,
                                        ),
                                      ),
                                    ],
                                  ),
                                  //Definição da pelagem
                                  Text(
                                    postagem.corPelagem!,
                                    style: const TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),

                                  //Verifica se o animal possui coleira
                                  if (postagem.coleira == true)
                                    const Text(
                                      "Possui coleira.",
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    )
                                  else
                                    const Text(
                                      "Não possui coleira.",
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),

                                  // Verifica se o animal está desnutrido
                                  if (postagem.desnutrido == true)
                                    const Text(
                                      "Aparenta estar desnutrido.",
                                      style: TextStyle(
                                        fontSize: 18,
                                        //color:
                                        //    CustomColors.customContrastColor
                                      ),
                                    )
                                  else
                                    const Text(
                                      "Não aparenta estar desnutrido.",
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),

                                  //Verifica se é docil
                                  if (postagem.docil == true)
                                    const Text(
                                      "Aparenta ser dócil.",
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    )
                                  else
                                    const Text(
                                      "Não aparenta ser dócil.",
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),

                                  //Verifica se está machucado
                                  if (postagem.machucado == true)
                                    const Text(
                                      "Aparenta estar machucado.",
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    )
                                  else
                                    const Text(
                                      "Não aparenta estar machucado.",
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),

                                  //Porte do animal
                                  Text(
                                    postagem.porte!,
                                    style: const TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  //Localização do animal
                                  const Padding(
                                    padding: EdgeInsets.only(top: 15),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.location_on_outlined,
                                          color:
                                              Color.fromARGB(255, 84, 20, 95),
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          "Localização:",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  //Localização transformada em endereço de rua
                                  /*FutureBuilder<String>(
                                    future: utilsServices
                                        .getUserName(postagem.localizacao!),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return const Text(
                                            "Obtendo endereço...");
                                      } else if (snapshot.hasError) {
                                        return const Text(
                                            "Erro ao obter endereço");
                                      } else {
                                        return Text(
                                          snapshot.data!,
                                          style: const TextStyle(
                                            fontSize: 18,
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                  //Apresentaro valor de latitude e longitude
                                  Text(
                                    "Lat: ${postagem.localizacao!.latitude} Long: ${postagem.localizacao!.longitude}",
                                    style: const TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),*/
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),*/
          ],
        ),
      ),
    );
  }
}
