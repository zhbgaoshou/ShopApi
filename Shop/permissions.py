
from rest_framework.permissions import BasePermission


class VersionPermission(BasePermission):

    def has_permission(self, request, view):

        version = request.version
        if version == 'v2':
            if request.auth:
                return True
            else:
                return False
        else:
            return True
