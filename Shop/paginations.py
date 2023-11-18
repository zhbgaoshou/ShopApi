from rest_framework import pagination


# 继承分页类
class PublicPagination(pagination.PageNumberPagination):
    page_query_description = '分页参数，当前的页数'
    page_size_query_description = "每页的显示的页数，默认为10条数据，最大为200条"
    """
    自定义分页类
    通过page_size指定默认的每页数据量，
    page_size_query_param指定每页自定义的数据量的参数，如果请求page_size=4，则每页显示4个，否则走默认的2
    max_page_size是允许设置的每页最大的数据量
    """
    page_size = 10  # 每页显示的默认数据个数
    page_query_param = 'page'  # 页号,第几页的参数 ,比如定义为pages，那么请求分页的参数就应该是pages
    page_size_query_param = 'page_size'  # 自己指定每页显示多少个数
    max_page_size = 200  # 最大允许设置的每页显示的数量

    # last_page_strings用于指定表示请求最后一页的参数
    # page=last的时候会直接到最后一页
    # 如果不改参数的话，可以不用设置，不设置的话默认参数就是last
    last_page_strings = 'last'

    def get_page_number(self, request, paginator):
        page_number = request.query_params.get(self.page_query_param, '1')
        if page_number in self.last_page_strings:
            page_number = paginator.num_pages
        return page_number
