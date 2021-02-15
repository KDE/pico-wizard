# SPDX-FileCopyrightText: 2021 Anupam Basak <anupam.basak27@gmail.com>
#
# SPDX-License-Identifier: MIT

import os

from PySide2.QtCore import QUrl, Slot
from PySide2.QtQml import qmlRegisterType

from PicoWizard.module import Module


class Personalization(Module):
    def __init__(self, parent=None):
        super().__init__(__file__, parent)

    @staticmethod
    def registerTypes() -> None:
        qmlRegisterType(Personalization, 'PicoWizard', 1, 0, 'PersonalizationModule')

    @staticmethod
    def qmlPath() -> QUrl:
        return QUrl(os.path.join(os.path.dirname(os.path.realpath(__file__)), "Personalization.qml"))

    @Slot(None, result=str)
    def moduleName(self) -> str:
        return self.tr("Personalization")