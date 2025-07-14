import 'package:flutter/material.dart';
import 'package:flutter_application_5/book_tile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  final List<BookTile> books = const [
    BookTile(
      title: "The Art of The Deal",
      author: "Donald Trump",
      date: "1987",
      description:
          "A book about business negotiations and deal-making strategies.",
    ),
    BookTile(
      title: "To Kill a Mockingbird",
      author: "Harper Lee",
      date: "1960",
      description:
          "A classic novel about racial injustice and moral growth in the American South.",
    ),
    BookTile(
      title: "1984",
      author: "George Orwell",
      date: "1949",
      description:
          "A dystopian novel about totalitarianism and surveillance society.",
    ),
    BookTile(
      title: "Pride and Prejudice",
      author: "Jane Austen",
      date: "1813",
      description:
          "A romantic novel exploring themes of love, marriage, and social class.",
    ),
    BookTile(
      title: "The Great Gatsby",
      author: "F. Scott Fitzgerald",
      date: "1925",
      description:
          "A story of the Jazz Age and the American Dream's corruption.",
    ),
    BookTile(
      title: "Harry Potter and the Philosopher's Stone",
      author: "J.K. Rowling",
      date: "1997",
      description: "The first book in the magical Harry Potter series.",
    ),
    BookTile(
      title: "The Catcher in the Rye",
      author: "J.D. Salinger",
      date: "1951",
      description:
          "A coming-of-age story about teenage rebellion and alienation.",
    ),
    BookTile(
      title: "Lord of the Flies",
      author: "William Golding",
      date: "1954",
      description:
          "A novel about civilization versus savagery on a deserted island.",
    ),
    BookTile(
      title: "The Hobbit",
      author: "J.R.R. Tolkien",
      date: "1937",
      description: "A fantasy adventure about a hobbit's unexpected journey.",
    ),
    BookTile(
      title: "Dune",
      author: "Frank Herbert",
      date: "1965",
      description:
          "An epic science fiction novel set on the desert planet Arrakis.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: books.length,
        itemBuilder: (context, index) => BookTileWidget(book: books[index]),
      ),
    );
  }
}
