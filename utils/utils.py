import time
import uuid


def generate_order_number():
    """
    自动生成订单号，返回时间戳
    """
    return int(time.time())


def generate_uuid():
    return uuid.uuid4()


def generate_image_path(instance, filename, appname):
    file_name = f'{generate_order_number()}==={generate_uuid()}'
    print('instance', instance)
    print('filename', filename)
    print('appname', appname)

    return f'static/{appname}/{filename}'
