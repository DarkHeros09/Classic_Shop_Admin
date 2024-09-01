import 'package:classic_shop_admin/src/features/product_items/core/data/product_item_remote_service.dart';

class ProductItemUpdateDeleteRemoteService extends ProductItemRemoteService {
  ProductItemUpdateDeleteRemoteService(
    super.productApi,
    super.productAdminApi,
    super.headersCache,
  );
}
