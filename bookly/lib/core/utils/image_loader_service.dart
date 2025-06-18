import 'package:bookly/core/Errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class ImageLoaderService {
  Future<Either<Failure, String>> getLoadableImageUrl(String rawUrl);
}

class CorsProxyImageLoader implements ImageLoaderService {
  @override
  Future<Either<Failure, String>> getLoadableImageUrl(String rawUrl) async {
    try {
      if (rawUrl.isEmpty) {
        return Left(InvalidUrlFailure(
          message: 'Empty image URL provided',
          code: 'EMPTY_IMAGE_URL',
        ));
      }

      final uri = Uri.tryParse(rawUrl);
      if (uri == null || !(uri.hasScheme && uri.hasAuthority)) {
        return Left(InvalidUrlFailure(
          message: 'Invalid image URL: $rawUrl',
          code: 'INVALID_IMAGE_URL',
        ));
      }

      final proxiedUrl = "https://corsproxy.io/?${Uri.encodeComponent(rawUrl)}";

      final proxiedUri = Uri.tryParse(proxiedUrl);
      if (proxiedUri == null ||
          !(proxiedUri.hasScheme && proxiedUri.hasAuthority)) {
        return Left(ImageProcessingFailure(
          message: 'Failed to create a valid proxied URL.',
          code: 'INVALID_PROXIED_URL',
        ));
      }

      return Right(proxiedUrl);
    } on FormatException catch (e) {
      return Left(ImageProcessingFailure.fromException(e));
    } on Exception catch (e) {
      return Left(Failure.fromException(e));
    }
  }
}
