import 'package:app3/core/networking/api_endpoint.dart';
import 'package:app3/core/networking/dio_factory.dart';
import 'package:app3/features/auth/data/models/book_model.dart';

class HomeRepo {

  Future<BookModel?> getBestSellerBox() async {
    try {
      final response = await DioFactory.dio?.get(
        ApiEndPoint.bestSeller,
      );

      if (response?.statusCode == 200) {
        BookModel booksModel = BookModel.fromJson(response!.data);
        return booksModel;
      } else {
        return null;
      }

    } catch (e) {
      print("Best Seller Error: $e");
      return null;
    }
  }

  static Future<List<Products?>?> search(String text) async {
    try {
      final response = await DioFactory.dio?.get(
        ApiEndPoint.search,
        queryParameters: {
          "name": text,
        },
      );

      if (response?.statusCode == 200) {
        BookModel bookModel = BookModel.fromJson(response!.data);
        return bookModel.data?.products;
      } else {
        return null;
      }

    } catch (e) {
      print("Search Error: $e");
      return null;
    }
  }
}