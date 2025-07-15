import 'package:flutter/material.dart';

class BookTile {
  final String title;
  final String author;
  final String date;
  final String description;
  final String image;

  const BookTile({
    required this.title,
    required this.author,
    required this.date,
    required this.description,
    required this.image,
  });
}

class BookDetailPage extends StatelessWidget {
  final BookTile book;

  const BookDetailPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(book.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 書本封面照片
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(
                  book.image,
                  height: 200,
                  width: 150,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 200,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: const Icon(
                        Icons.book,
                        size: 50,
                        color: Colors.grey,
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 24.0),
            Text(
              'Author: ${book.author}',
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(color: Colors.grey[700]),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Published: ${book.date}',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Description:',
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              book.description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}

class BookTileWidget extends StatelessWidget {
  final BookTile book;

  const BookTileWidget({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BookDetailPage(book: book)),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16.0),
          itemCount: 4,
          separatorBuilder: (context, index) =>
              const Divider(height: 16.0, thickness: 1.0, color: Colors.grey),
          itemBuilder: (context, index) {
            switch (index) {
              case 0:
                return Text(
                  book.title,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                );
              case 1:
                return Text(
                  'Author: ${book.author}',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(color: Colors.grey[700]),
                );
              case 2:
                return Text(
                  'Published: ${book.date}',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
                );
              case 3:
                return Text(
                  book.description,
                  style: Theme.of(context).textTheme.bodyMedium,
                );
              default:
                return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
