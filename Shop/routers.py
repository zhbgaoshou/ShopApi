from account.router import account_router
from comment.router import comment_router
from coupon.router import coupon_router
from index.router import index_router
from product.router import product_router
from User.router import user_router


class Routers:

    @staticmethod
    def get_router():
        routes = []
        routes += (
                account_router() +
                comment_router() +
                coupon_router() +
                index_router() +
                product_router() +
                user_router()
        )
        return routes
