import React from 'react';
import {FormattedMessage} from 'react-intl';
import MCIconURL from './mc/mc-icon.png';
import MCUrl from './mc/mc.png';

export default [
    {
        name: 'Craftabor',
        extensionId: 'craftabor',
        collaborator: 'Craftabor',
        iconURL: MCIconURL,
        insetIconURL: MCUrl,
        description: (
            <FormattedMessage
                defaultMessage="Craftabor"
                description="Craftabor"
                id="gui.extension.craftabor.description"
            />
        ),
        featured: true,
        disabled: false,
        bluetoothRequired: false,
        internetConnectionRequired: true,
        helpLink: 'https://craftabor.com'
    }
];
