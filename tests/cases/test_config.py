# coding=utf8

from toolkit.config import (
    parse,
    parse_file,
    YamlParser,
    JsonParser,
    ConfigParsedError
)


def test_parse(pretty):
    with open('tests/testfiles/env.yaml') as f:
        config = parse(f)
        assert config
        pretty(config)


def test_parse_file(pretty):
    config = parse_file('tests/testfiles/env.yaml')
    assert config
    pretty(config)
