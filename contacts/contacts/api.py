from rest_framework import routers, serializers, viewsets
from .models import Person, PhoneNumber
import logging

logger = logging.getLogger(__name__)
# Serializers define the API representation.


class PhoneNumberSerializer(serializers.ModelSerializer):
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
        logger.info(PhoneNumber._meta.pk.name)
        person = Person.objects.create_or_update(**validated_data)
        logger.info(phones)
        for p in phones:
            logger.info(p.get("id", None))


class PersonViewSet(viewsets.ModelViewSet):
    queryset = Person.objects.all()
    serializer_class = PersonSerializer


# Routers provide an easy way of automatically determining the URL conf.
router = routers.DefaultRouter()
router.register(r"person", PersonViewSet)

