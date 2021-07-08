FROM swift:5.4.1-focal

WORKDIR /src

ADD Package.swift Package.swift
ADD Sources Sources
ADD Tests Tests

RUN swift test