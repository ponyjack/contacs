from rest_framework import routers, serializers, viewsets
from .models import Person, PhoneNumber
import logging

logger = logging.getLogger(__name__)
# Serializers define the API representation.


class PhoneNumberSerializer(serializers.ModelSerializer):
    id = serializers.ModelField(
        model_field=PhoneNumber._meta.get_field("id"), required=False
    )

    class Meta:
        model = PhoneNumber
        exclude = ()


class PersonSerializer(serializers.ModelSerializer):
    #
    phones = PhoneNumberSerializer(many=True, required=False)

    class Meta:
        model = Person
        exclude = ()

    def create(self, validated_data):
        phones = validated_data.pop("phones", [])

        person = Person.objects.create(**validated_data)

        for p in phones:
            PhoneNumber.objects.create(person=person, **p)
        return person

    def update(self, instance, validated_data):
        phones = validated_data.pop("phones", [])

        for attr, value in validated_data.items():
            setattr(instance, attr, value)
        for p in phones:
            pid = p.pop("id", None)
            p.person = instance
            PhoneNumber.objects.update_or_create(defaults=p, id=pid, person=instance)

        return instance


class PersonViewSet(viewsets.ModelViewSet):
    queryset = Person.objects.all()
    serializer_class = PersonSerializer


class PhoneViewset(viewsets.ModelViewSet):
    queryset = PhoneNumber.objects.all()
    serializer_class = PhoneNumberSerializer


# Routers provide an easy way of automatically determining the URL conf.
router = routers.DefaultRouter()
router.register(r"person", PersonViewSet)
router.register(r"person_phone", PhoneViewset)

logging.info(router.urls)
