# Copyright (c) 2018 Red Hat, Inc.
# This program and the accompanying materials are made
# available under the terms of the Eclipse Public License 2.0
# which is available at https://www.eclipse.org/legal/epl-2.0/
#
# SPDX-License-Identifier: EPL-2.0
#
# Contributors:
#   Red Hat, Inc. - initial API and implementation

FROM node:8.12.0-alpine

# Install basic software used for checking github API rate limit
RUN apk add --update --no-cache curl jq expect

# Install tools required to build theia
RUN apk add make gcc g++ python git bash

USER theia
WORKDIR /projects
ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
