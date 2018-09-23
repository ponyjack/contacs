from rest_framework import routers, serializers, viewsets
from .models import (
    Person,
    PhoneNumber,
    EmailAddress,
    InstantMessenger,
    WebSite,
    StreetAddress,
    SpecialDate,
)
import logging
import json
from django.shortcuts import get_object_or_404
from django.core.exceptions import PermissionDenied
from rest_framework.permissions import IsAuthenticated

logger = logging.getLogger(__name__)
# Serializers define the API representation.


class PhoneNumberSerializer(serializers.ModelSerializer):
    id = serializers.ModelField(
        model_field=PhoneNumber._meta.get_field("id"), required=False
    )

    def validate(self, data):
        """
        Check that the start is before the stop.
        """
        if "person" not in data or data["person"].user != self.context["request"].user:
            raise serializers.ValidationError("person field is invild")

        return data

    class Meta:
        model = PhoneNumber
        exclude = ()


class EmailAddressSerializer(serializers.ModelSerializer):
    id = serializers.ModelField(
        model_field=EmailAddress._meta.get_field("id"), required=False
    )

    def validate(self, data):
        """
        Check that the start is before the stop.
        """
        if "person" not in data or data["person"].user != self.context["request"].user:
            raise serializers.ValidationError("person field is invild")

        return data

    class Meta:
        model = EmailAddress
        exclude = ()


class InstantMessengerSerializer(serializers.ModelSerializer):
    id = serializers.ModelField(
        model_field=InstantMessenger._meta.get_field("id"), required=False
    )

    def validate(self, data):
        """
        Check that the start is before the stop.
        """
        if "person" not in data or data["person"].user != self.context["request"].user:
            raise serializers.ValidationError("person field is invild")

        return data

    class Meta:
        model = InstantMessenger
        exclude = ()


class WebSiteSerializer(serializers.ModelSerializer):
    id = serializers.ModelField(
        model_field=WebSite._meta.get_field("id"), required=False
    )

    def validate(self, data):
        """
        Check that the start is before the stop.
        """
        if "person" not in data or data["person"].user != self.context["request"].user:
            raise serializers.ValidationError("person field is invild")

        return data

    class Meta:
        model = WebSite
        exclude = ()


class StreetAddressSerializer(serializers.ModelSerializer):
    id = serializers.ModelField(
        model_field=StreetAddress._meta.get_field("id"), required=False
    )

    def validate(self, data):
        """
        Check that the start is before the stop.
        """
        if "person" not in data or data["person"].user != self.context["request"].user:
            raise serializers.ValidationError("person field is invild")

        return data

    class Meta:
        model = StreetAddress
        exclude = ()


class SpecialDateSerializer(serializers.ModelSerializer):
    id = serializers.ModelField(
        model_field=SpecialDate._meta.get_field("id"), required=False
    )

    def validate(self, data):
        """
        Check that the start is before the stop.
        """
        if "person" not in data or data["person"].user != self.context["request"].user:
            raise serializers.ValidationError("person field is invild")

        return data

    class Meta:
        model = SpecialDate
        exclude = ()


class PersonSerializer(serializers.ModelSerializer):
    #
    phones = PhoneNumberSerializer(many=True, required=False)
    emails = EmailAddressSerializer(many=True, required=False)
    ims = InstantMessengerSerializer(many=True, required=False)
    webs = WebSiteSerializer(many=True, required=False)
    address = StreetAddressSerializer(many=True, required=False)
    specialdatas = SpecialDateSerializer(many=True, required=False)

    class Meta:
        model = Person
        exclude = ()

    def create(self, validated_data):
        phones = validated_data.pop("phones", [])
        emails = validated_data.pop("emails", [])
        ims = validated_data.pop("ims", [])
        webs = validated_data.pop("webs", [])
        address = validated_data.pop("address", [])
        specialdatas = validated_data.pop("specialdatas", [])

        person = Person.objects.create(**validated_data)

        for p in phones:
            EmailAddress.objects.create(person=person, **p)

        for p in emails:
            EmailAddress.objects.create(person=person, **p)

        for p in ims:
            InstantMessenger.objects.create(person=person, **p)

        for p in webs:
            WebSite.objects.create(peson=person, **p)
        for p in address:
            StreetAddress.objects.create(person=person, **p)

        for p in specialdatas:
            SpecialDate.objects.create(person=person, **p)

        return person

    def update(self, instance, validated_data):
        phones = validated_data.pop("phones", [])
        emails = validated_data.pop("emails", [])
        ims = validated_data.pop("ims", [])
        webs = validated_data.pop("webs", [])
        address = validated_data.pop("address", [])
        specialdatas = validated_data.pop("specialdatas", [])

        for attr, value in validated_data.items():
            setattr(instance, attr, value)

        for p in phones:
            pid = p.pop("id", None)
            p.person = instance
            PhoneNumber.objects.update_or_create(defaults=p, id=pid, person=instance)

        for p in emails:
            pid = p.pop("id", None)
            p.person = instance
            EmailAddress.objects.update_or_create(defaults=p, id=pid, person=instance)

        for p in ims:
            pid = p.pop("id", None)
            p.person = instance
            InstantMessenger.objects.update_or_create(
                defaults=p, id=pid, person=instance
            )

        for p in webs:
            pid = p.pop("id", None)
            p.person = instance
            WebSite.objects.update_or_create(defaults=p, id=pid, person=instance)

        for p in address:
            pid = p.pop("id", None)
            p.person = instance
            StreetAddress.objects.update_or_create(defaults=p, id=pid, person=instance)

        for p in specialdatas:
            pid = p.pop("id", None)
            p.person = instance
            SpecialDate.objects.update_or_create(defaults=p, id=pid, person=instance)

        return instance


class PersonViewSet(viewsets.ModelViewSet):
    queryset = Person.objects.all()
    serializer_class = PersonSerializer
    permission_classes = (IsAuthenticated,)

    def get_object(self):
        obj = get_object_or_404(self.get_queryset(), pk=self.kwargs["pk"])
        self.check_object_permissions(self.request, obj)
        if not obj.person or (obj.person.user != self.request.user):
            raise PermissionDenied()
        return obj


class PhoneViewset(viewsets.ModelViewSet):
    queryset = PhoneNumber.objects.all()
    serializer_class = PhoneNumberSerializer
    permission_classes = (IsAuthenticated,)

    def finalize_response(self, request, response, *args, **kwargs):
        respond = super().finalize_response(request, response, *args, **kwargs)
        # respond.data["message"] = json.dumps(respond.data)
        return respond

    def get_object(self):
        obj = get_object_or_404(self.get_queryset(), pk=self.kwargs["pk"])
        self.check_object_permissions(self.request, obj)
        if not obj.person or (obj.person.user != self.request.user):
            raise PermissionDenied()
        return obj


# Routers provide an easy way of automatically determining the URL conf.
router = routers.DefaultRouter()
router.register(r"person", PersonViewSet)
router.register(r"person_phone", PhoneViewset)

logging.info(router.urls)
